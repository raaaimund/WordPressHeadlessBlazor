using BertlsBlog.Client.Models;

namespace BertlsBlog.Client.Responses
{
    public class GetBlogPostsResponse
    {
        public PostsContent Posts { get; set; }

        public class PostsContent
        {
            public BlogPost[] Nodes { get; set; }
        }
    }
}
