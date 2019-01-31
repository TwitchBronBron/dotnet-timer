using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace Timer.Controllers
{
    [Route("")]
    public class RootController : ApiController
    {
        [Route("")]
        [HttpGet]
        public async Task<string> DoTimeout([FromUri]int? seconds = null)
        {
            if (seconds != null)
            {
                await Task.Delay(seconds.Value * 1000);
                return $"delayed response for {seconds} seconds.";
            }
            else
            {
                return "delayed response for 0 seconds. Pass the 'seconds' querystring parameter to delay response for longer.";
            }
        }
    }
}
