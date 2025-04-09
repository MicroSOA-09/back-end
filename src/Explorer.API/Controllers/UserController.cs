using Explorer.BuildingBlocks.Core.UseCases;
using Explorer.Stakeholders.API.Dtos;
using Explorer.Stakeholders.API.Public;
using Microsoft.AspNetCore.Mvc;

namespace Explorer.API.Controllers
{
    [Route("api/user")]
    public class UserController : BaseApiController
    {
        private readonly IUserService _userService;
        private readonly IAccountManagementService _accountService;

        public UserController(IUserService userService, IAccountManagementService accountService)
        {
            _userService = userService;
            _accountService = accountService;
        }

        [HttpGet("getById/{userId}")]
        public ActionResult<UserDto> Get(int userId)
        {
            var result = _userService.Get(userId);
            return CreateResponse(result);
        }
        
        [HttpGet("getUsernames/{userIds}")]
        public ActionResult<PagedResult<UserDto>> GetUsernames(string userIds)
        {
            List<int> ids = new List<int>();
            foreach (var id in userIds.Split(',').ToList())
            {
             ids.Add(int.Parse(id));   
            }
            
            var results = _userService.GetUsernames(ids);
            return CreateResponse(results);
        }

        [HttpGet("confirm-account")]
        public ActionResult<UserDto> ConfirmRegistration(string token)
        {
            var result = _userService.ConfirmRegistration(token);
            return CreateResponse(result);
        }

    }
}
