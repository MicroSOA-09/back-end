using Explorer.Stakeholders.API.Dtos;
using Explorer.Stakeholders.API.Public;
using Explorer.Stakeholders.Core.Domain;
using FluentResults;
using Microsoft.AspNetCore.Mvc;

namespace Explorer.API.Controllers;

[Route("api/test")]
public class TestController : BaseApiController
{
    [HttpGet]
    public IActionResult Get()
    {
        return Ok(new { message = "API is working" });
    }
}