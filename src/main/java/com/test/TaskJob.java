package com.test;

import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by YMSX30004 on 2016/12/14.
 */
@Service
public class TaskJob {

    public void job(){
        System.out.println("-------------------------------------------华丽的分隔线");
    }
    public void job2(){
        System.out.println(new Date().toString());
    }
}
