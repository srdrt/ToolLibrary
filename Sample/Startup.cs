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

            services.AddMemoryCache();
            
            var redisConnection = Configuration.GetValue("AppSettings:RedisConnection", string.Empty);

            if (!string.IsNullOrEmpty(redisConnection))
            {
                //Distributed cache configuration
                var redisCacheDb = Configuration.GetValue("AppSettings:RedisCacheDb", string.Empty);
                redisConnection = redisConnection.Remove(redisConnection.Length - 1, 1) + (!string.IsNullOrEmpty(redisCacheDb) ? redisCacheDb : "7");

                //services.AddDistributedRedisCache(option => { option.Configuration = redisConnection; });

                //Hangfire configuration
                var hangfireRedisPrefix = Configuration.GetValue("AppSettings:HangfireRedisPrefix", string.Empty);
                var hangfireRedisDb = Configuration.GetValue("AppSettings:HangfireRedisDb", string.Empty);
                var redisStorageOptions = new RedisStorageOptions
                {
                    Prefix = !string.IsNullOrEmpty(hangfireRedisPrefix) ? hangfireRedisPrefix : "{gaboras}:",
                    Db = !string.IsNullOrEmpty(hangfireRedisDb) ? int.Parse(hangfireRedisDb) : 3
                };
                var hangfireStorage = new RedisStorage(redisConnection, redisStorageOptions);

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