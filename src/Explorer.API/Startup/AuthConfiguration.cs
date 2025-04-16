using System.Security.Claims;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.Text.Encodings.Web;
using Microsoft.AspNetCore.Authentication;
using Microsoft.Extensions.Options;

namespace Explorer.API.Startup;

public static class AuthConfiguration
{
    public static IServiceCollection ConfigureAuth(this IServiceCollection services)
    {
        ConfigureAuthentication(services);
        ConfigureAuthorizationPolicies(services);
        return services;
    }

    private static void ConfigureAuthentication(IServiceCollection services)
    {
        services.AddAuthentication("HeaderAuth")
            .AddScheme<AuthenticationSchemeOptions, HeaderAuthenticationHandler>("HeaderAuth", null);
    }

    private static void ConfigureAuthorizationPolicies(IServiceCollection services)
    {
        services.AddAuthorization(options =>
        {
            options.AddPolicy("administratorPolicy", policy => policy.RequireRole("administrator"));
            options.AddPolicy("authorPolicy", policy => policy.RequireRole("author"));
            options.AddPolicy("touristPolicy", policy => policy.RequireRole("tourist"));

            options.AddPolicy("authorAndAdminPolicy", policy => policy.RequireRole("author", "administrator"));

            options.AddPolicy("touristAuthorPolicy", policy => policy.RequireRole("tourist", "author"));


        });
    }


    public class HeaderAuthenticationHandler : AuthenticationHandler<AuthenticationSchemeOptions>
    {
        public HeaderAuthenticationHandler(
            IOptionsMonitor<AuthenticationSchemeOptions> options,
            ILoggerFactory logger,
            UrlEncoder encoder,
            ISystemClock clock)
            : base(options, logger, encoder, clock)
        {
        }

        protected override async Task<AuthenticateResult> HandleAuthenticateAsync()
        {
            // Čitanje zaglavlja X-Username i X-User-Role
            if (!Request.Headers.TryGetValue("X-Username", out var usernameValues) ||
                !Request.Headers.TryGetValue("X-User-Role", out var roleValues))
            {
                Logger.LogWarning("Missing X-Username or X-User-Role headers");
                return AuthenticateResult.Fail("Missing required headers");
            }

            var username = usernameValues.FirstOrDefault();
            var role = roleValues.FirstOrDefault().ToLower();

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(role))
            {
                Logger.LogWarning("Empty X-Username or X-User-Role headers");
                return AuthenticateResult.Fail("Empty or invalid headers");
            }
            

            // Validacija uloge
            var validRoles = new[] { "administrator", "author", "tourist" };
            if (!validRoles.Contains(role))
            {
                Logger.LogWarning("Invalid role: {Role}", role);
                return AuthenticateResult.Fail("Invalid role");
            }

            // Kreiranje ClaimsIdentity sa username i role
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, username),
                new Claim(ClaimTypes.Role, role)
            };

            var identity = new ClaimsIdentity(claims, Scheme.Name);
            var principal = new ClaimsPrincipal(identity);
            var ticket = new AuthenticationTicket(principal, Scheme.Name);

            Logger.LogInformation("Successfully authenticated user: {Username} with role: {Role}", username, role);
            return AuthenticateResult.Success(ticket);
        }
    }
}