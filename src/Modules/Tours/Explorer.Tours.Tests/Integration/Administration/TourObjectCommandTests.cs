﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Explorer.API.Controllers.Administrator.Administration;
using Explorer.API.Controllers.Author.Administration;
using Explorer.Tours.API.Dtos;
using Explorer.Tours.API.Public.Administration;
using Explorer.Tours.Infrastructure.Database;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.DependencyInjection;
using Shouldly;

namespace Explorer.Tours.Tests.Integration.Administration
{

	[Collection("Sequential")]
	public class TourObjectCommandTests : BaseToursIntegrationTest
	{
		public TourObjectCommandTests(ToursTestFactory factory) : base(factory) { }

		[Fact]
		public void Creates()
		{
			// Arrange
			using var scope = Factory.Services.CreateScope();
			var controller = CreateController(scope);
			var dbContext = scope.ServiceProvider.GetRequiredService<ToursContext>();
			var newEntity = new TourObjectDto
			{
				Name = "wc pored puta",
				Description = "mali",
				ImageUrl = "priroda.png",
				Category = "Restaurant",
				Latitude = 15.678,
				Longitude = 28.987
			};

			// Act
			var result = ((ObjectResult)controller.Create(newEntity).Result)?.Value as TourObjectDto;

			// Assert - Response
			result.ShouldNotBeNull();
			result.Id.ShouldNotBe(0);
			result.Name.ShouldBe(newEntity.Name);

			// Assert - Database
			var storedEntity = dbContext.TourObject.FirstOrDefault(i => i.Name == newEntity.Name);
			storedEntity.ShouldNotBeNull();
			//storedEntity.Id.ShouldBe(result.Id);
		}
		/*

        [Fact]
        public void Create_fails_invalid_data()
        {
            // Arrange
            using var scope = Factory.Services.CreateScope();
            var controller = CreateController(scope);
            var updatedEntity = new TourObjectDto
            {
                Name = "wc pored puta",
                Description = "veliki",
                ImageUrl = "priroda.png",
                Category = "Toilet",
            };

            // Act
            var result = (ObjectResult)controller.Create(updatedEntity).Result;

            // Assert
            result.ShouldNotBeNull();
            result.StatusCode.ShouldBe(400);
        }*/


		[Fact]
		public void Updates()
		{
			// Arrange
			using var scope = Factory.Services.CreateScope();
			var controller = CreateController(scope);
			var dbContext = scope.ServiceProvider.GetRequiredService<ToursContext>();
			var updatedEntity = new TourObjectDto
			{
				Id = -1,
				Name = "wc blizu puta",
				Description = "veliki",
				ImageUrl = "priroda.png",
				Category = "Toilet",
				Latitude = 15.678,
				Longitude = 28.987
			};

			// Act
			var result = ((ObjectResult)controller.Update(updatedEntity).Result)?.Value as TourObjectDto;

			// Assert - Response
			result.ShouldNotBeNull();
			result.Id.ShouldBe(-1);
			result.Name.ShouldBe(updatedEntity.Name);
			result.Description.ShouldBe(updatedEntity.Description);

			// Assert - Database
			var storedEntity = dbContext.TourObject.FirstOrDefault(i => i.Name == "wc blizu puta");
			storedEntity.ShouldNotBeNull();
			storedEntity.Description.ShouldBe(updatedEntity.Description);
			var oldEntity = dbContext.TourObject.FirstOrDefault(i => i.Name == "Restoran Masa");
			oldEntity.ShouldBeNull();
		}

		[Fact]
		public void Update_fails_invalid_id()
		{
			// Arrange
			using var scope = Factory.Services.CreateScope();
			var controller = CreateController(scope);
			var updatedEntity = new TourObjectDto
			{
				Id = 5000,
				Name = "wc blizu puta",
				Description = "veliki",
				ImageUrl = "priroda.png",
				Category = "Toilet",
				Latitude = 15.678,
				Longitude = 28.987
			};

			// Act
			var result = (ObjectResult)controller.Update(updatedEntity).Result;

			// Assert
			result.ShouldNotBeNull();
			result.StatusCode.ShouldBe(404);
		}

		[Fact]
		public void Deletes()
		{
			// Arrange
			using var scope = Factory.Services.CreateScope();
			var controller = CreateController(scope);
			var dbContext = scope.ServiceProvider.GetRequiredService<ToursContext>();

			// Act
			var result = (OkResult)controller.Delete(-3);

			// Assert - Response
			result.ShouldNotBeNull();
			result.StatusCode.ShouldBe(200);

			// Assert - Database
			var storedCourse = dbContext.TourObject.FirstOrDefault(i => i.Id == -3);
			storedCourse.ShouldBeNull();
		}

		[Fact]
		public void Delete_fails_invalid_id()
		{
			// Arrange
			using var scope = Factory.Services.CreateScope();
			var controller = CreateController(scope);

			// Act
			var result = (ObjectResult)controller.Delete(-1000);

			// Assert
			result.ShouldNotBeNull();
			result.StatusCode.ShouldBe(404);
		}

		private static ObjectController CreateController(IServiceScope scope)
		{
			return new ObjectController(scope.ServiceProvider.GetRequiredService<ITourObjectService>())
			{
				ControllerContext = BuildContext("-1")
			};
		}
	}
}

