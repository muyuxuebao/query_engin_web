import com.query_engin.thrift.thriftImpl.RedisProxyService;
import com.query_engin.thrift.thriftImpl.User;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.junit.Test;

import java.util.List;

/**
 * Created by yinliang on 2016/4/22.
 */
public class BaseTest {
    @Test
    public void testUser() {

        try {
            TTransport transport;
            transport = new TSocket("192.168.243.142", 9090);

            TProtocol protocol = new TBinaryProtocol(transport);
            RedisProxyService.Client client = new RedisProxyService.Client(protocol);
            transport.open();
            User user = new User();
            user.setName("china_people");
            client.addUser(user);

            transport.close();
        } catch (TException x) {
            x.printStackTrace();
        }
    }

    @Test
    public void testGetALLUser() {

        try {
            TTransport transport;
            transport = new TSocket("192.168.243.142", 9090);

            TProtocol protocol = new TBinaryProtocol(transport);
            RedisProxyService.Client client = new RedisProxyService.Client(protocol);
            transport.open();

            List<User> userList = client.getAllUser();
            for (User user : userList) {
                System.out.println(user);
            }


            transport.close();
        } catch (TException x) {
            x.printStackTrace();
        }
    }
}
