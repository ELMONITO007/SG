﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Caching;
using System.Web.Mvc;


namespace EvaluacionesDeTransenerTransba.Filter
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = false)]
    public class PreventDuplicateRequestAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// The number of minutes that the results of POST requests will be kept in cache.
        /// </summary>
        private const int MinutesInCache = 1;

        /// <summary>
        /// Checks the cache for an existing __RequestVerificationToken, and updates the result object for duplicate requests.
        /// Executes for every request.
        /// </summary>
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            base.OnActionExecuting(filterContext);

            // Check if this request has already been performed recently
            string token = filterContext?.HttpContext?.Request?.Form["__RequestVerificationToken"];
            if (!string.IsNullOrEmpty(token))
            {
                var cache = filterContext.HttpContext.Cache[token];
                if (cache != null)
                {
                    // Optionally, assign an error message to discourage users from clicking submit multiple times (retrieve in the view using TempData["ErrorMessage"])
                    filterContext.Controller.TempData["ErrorMessage"] =
                        "Duplicate request detected. Please don't mash the submit buttons, they're fragile.";

                    if (cache is ActionResult actionResult)
                    {
                        filterContext.Result = actionResult;
                    }
                    else
                    {
                        // Provide a fallback in case the actual result is unavailable (redirects to controller index, assuming default routing behaviour)
                        string controller = filterContext.ActionDescriptor.ControllerDescriptor.ControllerName;
                        filterContext.Result = new RedirectResult("~/" + controller);
                    }
                }
                else
                {
                    // Put the token in the cache, along with an arbitrary value (here, a timestamp)
                    filterContext.HttpContext.Cache.Add(token, DateTime.UtcNow.ToString("s"),
                        null, Cache.NoAbsoluteExpiration, new TimeSpan(0, MinutesInCache, 0), CacheItemPriority.Default, null);
                }
            }
        }

        /// <summary>
        /// Adds the result of a completed request to the cache.
        /// Executes only for the first completed request.
        /// </summary>
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            base.OnActionExecuted(filterContext);

            string token = filterContext?.HttpContext?.Request?.Form["__RequestVerificationToken"];
            if (!string.IsNullOrEmpty(token))
            {
                // Cache the result of this request - this is the one we want!
                filterContext.HttpContext.Cache.Insert(token, filterContext.Result,
                    null, Cache.NoAbsoluteExpiration, new TimeSpan(0, MinutesInCache, 0), CacheItemPriority.Default, null);
            }
        }
    }
}