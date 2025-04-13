using System.Text;
using Explorer.Blog.API.Dtos;
using Explorer.Blog.API.Public;
using Explorer.Blog.Core.Domain;
using Explorer.Blog.Core.UseCases;
using Explorer.BuildingBlocks.Core.UseCases;
using Explorer.Tours.API.Dtos;
using FluentResults;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;

namespace Explorer.API.Controllers.Tourist.Blog
{
    [Authorize(Policy = "touristPolicy")]
    [Route("api/blog/blogpost")]
    public class BlogPostController : BaseApiController
    {
        private readonly IBlogPostService _blogPostService;
        public BlogPostController(IBlogPostService blogPostService)
        {
            _blogPostService = blogPostService;
        }

        // [HttpGet]
        // public ActionResult<PagedResult<BlogPostDto>> GetAll([FromQuery] int page, [FromQuery] int pageSize)
        // {
        //     var result = _blogPostService.GetAll(page, pageSize);
        //     return CreateResponse(result);
        // }
        
        [HttpGet]
        public async Task<IActionResult> GetBlogs()
        {
            var client = new HttpClient();
            var response = await client.GetAsync("http://blog-service:80/api/blog/blogpost");
            var json = await response.Content.ReadAsStringAsync();
            var result = Content(json, "application/json"); // Proširi direktno na front-end
            return result;
        }
        
        // [HttpGet("{blogPostId:int}")]
        // public ActionResult<BlogPostDto> GetById(int blogPostId)
        // {
        //     var result = _blogPostService.GetById(blogPostId);
        //     return CreateResponse(result);
        // }
        [HttpGet("{blogPostId}")]
        public async Task<IActionResult> GetBlog(string blogPostId)
        {
            var client = new HttpClient();
            var response = await client.GetAsync($"http://blog-service:80/api/blog/blogpost/{blogPostId}");
            var json = await response.Content.ReadAsStringAsync();
            return Content(json, "application/json"); // Proširi direktno na front-end
        }


        [HttpPost("{blogPostid:int}/comments")]
        public ActionResult<BlogPostDto> AddComment(int blogPostid, [FromBody] BlogPostCommentDto blogPostComment)
        {
            var result = _blogPostService.AddComment(blogPostid, blogPostComment);
            return CreateResponse(result);
        }
        [HttpPost("{blogPostid:int}/ratings")]
        public ActionResult<BlogPostDto> AddRating(int blogPostid, [FromBody] BlogPostRatingDto blogPostRating)
        {
            var result = _blogPostService.AddRating(blogPostid, blogPostRating);
            return CreateResponse(result);
        }

        // [HttpPost]
        // public ActionResult<BlogPostDto> Create([FromBody] BlogPostDto blogPost)
        // {
        //     var result = _blogPostService.Create(blogPost);
        //     return CreateResponse(result);
        // }
        
        [HttpPost]
        public async Task<ActionResult<BlogPostDto>> Create([FromBody] BlogPostDto blogPost)
        {
            var goBlogPost = new
            {
                AuthorID = blogPost.AuthorId,
                TourID = blogPost.TourId,
                authorUsername = blogPost.AuthorUsername,
                title = blogPost.Title,
                description = blogPost.Description,
                creationDate = blogPost.CreationDate,
                imageURLs = blogPost.ImageURLs,
                status = blogPost.Status
            };
            using var client = new HttpClient();
            
            
            var jsonContent = new StringContent(
                JsonConvert.SerializeObject(goBlogPost),
                Encoding.UTF8,
                "application/json"
            );
            var response = await client.PostAsync("http://blog-service:80/api/blog/blogpost", jsonContent);
            if (!response.IsSuccessStatusCode)
            {
                return StatusCode((int)response.StatusCode, await response.Content.ReadAsStringAsync());
            }
            
            var jsonResponse = await response.Content.ReadAsStringAsync();
            var createdBlog = JsonConvert.DeserializeObject<BlogPostDto>(jsonResponse);
            
            var result = Result.Ok(createdBlog); // Uspešan rezultat
            return CreateResponse(result);
        }
        
        

        [HttpPut("{blogPostId:int}/comments")]
        public ActionResult<BlogPostDto> UpdateComment(int blogPostId, [FromBody] BlogPostCommentDto editedComment)
        {
            var result = _blogPostService.UpdateComment(blogPostId, editedComment);
            return CreateResponse(result);
        }

        [HttpPut("{id:int}")]
        public ActionResult<BlogPostDto> Update([FromBody] BlogPostDto blogPost)
        {
            var result = _blogPostService.Update(blogPost);
            return CreateResponse(result);
        }

        [HttpDelete("{blogPostId:int}/comments/{userId:int}/{creationTime:datetime}")]
        public ActionResult<BlogPostDto> DeleteComment(int blogPostId, int userId, DateTime creationTime)
        {
            var result = _blogPostService.RemoveComment(blogPostId, userId, creationTime);
            return CreateResponse(result);
        }
        [HttpDelete("{blogPostId:int}/ratings/{userId:int}")]
        public ActionResult<BlogPostDto> DeleteRating(int blogPostId, int userId)
        {
            var result = _blogPostService.RemoveRating(blogPostId, userId);
            return CreateResponse(result);
        }

        [HttpDelete("{id:int}")]
        public ActionResult Delete(int id)
        {
            var result = _blogPostService.Delete(id);
            return CreateResponse(result);
        }

    }
}
