import com.query_engin.thrift.RedisProxyService;
import com.query_engin.thrift.User;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.junit.Test;

/**
 * Created by yinliang on 2016/4/22.
 */
public class BaseTest {
    @Test
    public void testUser() {

        try {
            TTransport transport;
            transport = new TSocket("192.168.243.140", 9090);
            transport.open();
            TProtocol protocol = new TBinaryProtocol(transport);
            RedisProxyService.Client client = new RedisProxyService.Client(protocol);

            User user = new User();
            user.setName("china_people");
            client.addUser(user);

            transport.close();
        } catch (TException x) {
            x.printStackTrace();
        }
    }
}
