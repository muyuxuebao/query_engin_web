import com.query_engin.thrift.thriftImpl.RedisProxyService;
import com.query_engin.thrift.thriftImpl.User;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.junit.Test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Test
    public void testHashMap() {
        Map<Integer, String> map = new HashMap<Integer, String>();

        for (int i = 0; i < 100; i++) {
            map.put(i, new Integer(i).toString());
        }

        for (int i = 0; i < 10; i++) {
            System.out.println(map.get(i * 10));
        }

    }

    @Test
    public void test4() {
        int i = 1;
        i ^= 2;
        System.out.println(i);
    }

    @Test
    public void test5() {
        for (int i = 0; i < 100; i++) {
            System.out.println(Integer.toBinaryString(i) + " " + Integer.toBinaryString(hash(i)));
        }

    }

    int hash(int h) {
        h ^= (h >>> 20) ^ (h >>> 12);
        return h ^ (h >>> 7) ^ (h >>> 4);
    }

    public int hashCode(String s) {
        int h = 0;
        char val[] = s.toCharArray();

        for (int i = 0; i < val.length; i++) {
            h = 31 * h + val[i];
        }
        return h;
    }
}
