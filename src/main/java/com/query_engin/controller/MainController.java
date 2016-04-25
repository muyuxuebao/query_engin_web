package com.query_engin.controller;

import com.query_engin.thrift.ThriftProxy;
import com.query_engin.thrift.thriftImpl.User;
import com.query_engin.thrift.thriftImpl.Word;
import org.apache.thrift.TException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by dzkan on 2016/3/8.
 */
@Controller
public class MainController {
    @Autowired
    ThriftProxy thriftProxy;


    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String addUser(@RequestParam("a_user_name") String a_user_name) {
        System.out.println("a_user_name  = " + a_user_name);
        User user = new User();
        user.setName(a_user_name);
        try {
            long id = thriftProxy.addUser(user);
            System.out.println("The id of user is " + id);
        } catch (TException e) {
            e.printStackTrace();
        }
        return "index";
    }

    @RequestMapping(value = "/addWord", method = RequestMethod.GET)
    public String addWord(@RequestParam("a_word_name") String a_word_name) {
        System.out.println("a_word_name  = " + a_word_name);
        Word word = new Word();
        word.setName(a_word_name);
        try {
            long id = thriftProxy.addWord(word);
            System.out.println("The id of word is " + id);
        } catch (TException e) {
            e.printStackTrace();
        }
        return "index";
    }

    @RequestMapping(value = "/userbuyword", method = RequestMethod.GET)
    public String userbuyword(@RequestParam("userselect") long userselect, @RequestParam("userselect") long wordselect) {
        try {
            this.thriftProxy.userBuyWord(userselect, wordselect);
        } catch (TException e) {
            e.printStackTrace();
        }
        return "index";
    }

    @RequestMapping(value = "/userquery", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> userquery(@RequestParam("searchstr") String searchstr) {
        Map<String, Object> map = new HashMap<String, Object>();
        try {
            map.put("chargeusers", thriftProxy.getChargeUsers(searchstr));
        } catch (TException e) {
            e.printStackTrace();
        }

        return map;
    }


    @RequestMapping(value = "/initpage", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> initUserAndWord(@RequestParam("pin") String pin, @RequestParam("money") BigDecimal money) {
        System.out.println("initUserAndWord pin:" + pin + " money:" + money);

        Map<String, Object> map = new HashMap<String, Object>();

        try {
            map.put("userList", thriftProxy.getAllUser());
            map.put("wordList", thriftProxy.getAllWord());
        } catch (TException e) {
            e.printStackTrace();
        }

        return map;
    }
    //initUserAndWord
}