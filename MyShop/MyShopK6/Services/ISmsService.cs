using System.Threading.Tasks;
using MyShopK6.Models;
using Twilio.Rest.Api.V2010.Account;

namespace MyShopK6.Services
{
    public interface ISmsService
    {
        Task<MessageResource> Send(SmsMessage smsMessage);
    }
}
