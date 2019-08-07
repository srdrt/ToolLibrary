using Hangfire;
using Microsoft.AspNetCore.Builder;
using Newtonsoft.Json;
using System;
using Humanizer;
using Microsoft.Extensions.Configuration;
using Sample.ActionFilters;

namespace Sample
{
    public partial class Startup
    {
        private static readonly string QueueName = "queue_" + Environment.MachineName.Underscore();

        public static void JobConfiguration(IApplicationBuilder app, IConfiguration configuration)
        {
            var enableJobsSetting = configuration.GetValue("AppSettings:EnableJobs", string.Empty);
            var redisConnection = configuration.GetValue("AppSettings:RedisConnection", string.Empty);

            if (!string.IsNullOrEmpty(enableJobsSetting) && !string.IsNullOrEmpty(redisConnection))
            {
                var enableJobs = bool.Parse(enableJobsSetting);

                if (!enableJobs)
                    return;
            }
            else
                return;

            app.UseHangfireServer(new BackgroundJobServerOptions
            {
                Queues = new[] { QueueName, "default" }
            });

            app.UseHangfireDashboard("/jobs", new DashboardOptions { Authorization = new[] { new HangfireAuthorizationFilter() } });
            GlobalConfiguration.Configuration.UseSerializerSettings(new JsonSerializerSettings { ReferenceLoopHandling = ReferenceLoopHandling.Ignore });

            ConfigureRecurringJobs();

            GlobalJobFilters.Filters.Add(new AutomaticRetryAttribute { Attempts = 0 });
        }

        public static void ConfigureRecurringJobs()
        {
            //RecurringJob.AddOrUpdate<Jobs.TestRecurring>("test-recurring", test => test.TestMethod(), Cron.Daily(13, 00), TimeZoneInfo.Utc, QueueName);
        }
    }
}