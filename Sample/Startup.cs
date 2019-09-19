using Hangfire;
using Hangfire.Redis;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace Sample
{
    public partial class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            DIRegister(services, Configuration);

            services.Configure<CookiePolicyOptions>(options =>
            {
                options.CheckConsentNeeded = context => true;
                options.MinimumSameSitePolicy = SameSiteMode.None;
            });

            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);

            services.AddCors(options =>
            {
                options.AddPolicy("AllowAll",
                    builder =>
                    {
                        builder
                            .SetIsOriginAllowed(_ => true)
                            .AllowAnyMethod()
                            .AllowAnyHeader()
                            .AllowCredentials();
                    });
            });

            var redisConnection = Configuration.GetValue("AppSettings:RedisConnection", string.Empty);

            if (!string.IsNullOrEmpty(redisConnection))
            {
                //Change redis database to db3 for standard cache
                var redisConnectionCache = redisConnection.Remove(redisConnection.Length - 1, 1) + "3";
                services.AddDistributedRedisCache(option => { option.Configuration = redisConnectionCache; });

                //Change redis database to db4 for Hangfire
                var redisConnectionHangfire = redisConnection.Remove(redisConnection.Length - 1, 1) + "4";
                var hangfireStorage = new RedisStorage(redisConnectionHangfire);
                GlobalConfiguration.Configuration.UseStorage(hangfireStorage);
                services.AddHangfire(x => x.UseStorage(hangfireStorage));
            }
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
                app.UseDeveloperExceptionPage();
            else
                app.UseExceptionHandler("/Home/Error");

            var httpsRedirection = Configuration.GetValue("AppSettings:HttpsRedirection", string.Empty);

            if (!string.IsNullOrEmpty(httpsRedirection) && bool.Parse(httpsRedirection))
            {
                app.UseHsts().UseHttpsRedirection();
            }

            app.UseCors("AllowAll");
            app.UseStaticFiles();
            app.UseCookiePolicy();

            JobConfiguration(app, Configuration);

            app.UseMvc(routes =>
            {
                routes.MapRoute(
                    name: "default",
                    template: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}