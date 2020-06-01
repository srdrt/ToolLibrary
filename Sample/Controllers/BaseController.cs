using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace Sample.Controllers
{
    public class BaseController : Controller
    {
        public static int TenantId { get; set; }
        public static int UserId { get; set; }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            var requestHeader = context.HttpContext.Request.Headers;

            if (!requestHeader.TryGetValue("X-Tenant-Id", out var xTenantId))
            {
                context.Result = new BadRequestObjectResult("X-Tenant-Id cannot be null.");
                return;
            }

            if (!requestHeader.TryGetValue("X-User-Id", out var xUserId))
            {
                context.Result = new BadRequestObjectResult("X-User-Id cannot be null.");
                return;
            }

            if (!int.TryParse(xTenantId, out var tenantId))
            {
                context.Result = new BadRequestObjectResult("X-Tenant-Id must be a number.");
                return;
            }

            if (!int.TryParse(xUserId, out var userId))
            {
                context.Result = new BadRequestObjectResult("X-User-Id must be a number.");
                return;
            }

            TenantId = tenantId;
            UserId = userId;
        }
    }
}