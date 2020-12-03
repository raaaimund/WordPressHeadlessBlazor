using System.Threading.Tasks;
using BertlsBlog.Client.Responses;
using FluentAssertions;
using GraphQL;
using GraphQL.Client.Http;
using GraphQL.Client.Serializer.Newtonsoft;
using Xunit;

namespace BertlsBlog.Client.Tests
{
    public class GraphqlEndpointTests
    {
        [Fact]
        public async Task GetPostsShouldDeserializePosts()
        {
            var graphQLClient = new GraphQLHttpClient("http://localhost/graphql", new NewtonsoftJsonSerializer());
            var getBlogPostsRequest = new GraphQLRequest
            {
                Query = @"
                query GetPosts {
                    posts {
                        nodes {
                            id
                            title
                            date
                        }
                    }
                }"
            };
            var response = await graphQLClient.SendQueryAsync<GetBlogPostsResponse>(getBlogPostsRequest);
            var blogPosts = response.Data.Posts.Nodes;

            blogPosts.Should().HaveCountGreaterThan(0, "Blog posts should be loaded and deserialized.");
        }
    }
}
