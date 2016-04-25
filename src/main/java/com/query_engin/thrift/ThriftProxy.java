package com.query_engin.thrift;

import com.query_engin.thrift.thriftImpl.RedisProxyService;
import com.query_engin.thrift.thriftImpl.User;
import com.query_engin.thrift.thriftImpl.Word;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.apache.thrift.transport.TTransportException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import java.util.List;

/**
 * Created by yinliang on 2016/4/25.
 */
public class ThriftProxy {
    @Autowired
    RedisProxyService.Client client;
    @Autowired
    TTransport transport;

    void init() throws TTransportException {
        transport.open();
    }

    void exit() {
        transport.close();
    }

    public long addUser(User user) throws TException {
        return client.addUser(user);
    }

    public long addWord(Word word) throws TException {
        return client.addWord(word);
    }

    public List<User> getAllUser() throws TException {
        return client.getAllUser();
    }

    public List<Word> getAllWord() throws TException {
        return client.getAllWord();
    }

    public void userBuyWord(long userId, long wordId) throws TException {
        client.userBuyWord(userId, wordId);
    }

    public List<User> getChargeUsers(String str) throws TException {
        return client.getChargeUsers(str);
    }
    //getChargeUsers

}
