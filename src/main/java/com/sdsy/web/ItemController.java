package com.sdsy.web;

import com.sdsy.entity.ItemCat;
import com.sdsy.service.ItemCatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by 郭帅 on 2016/12/15.
 */
@Controller
@RequestMapping(value = "item/cat")
public class ItemController{

    @Autowired
    ItemCatService itemCatService;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<ItemCat>> list(){
        List<ItemCat> list = itemCatService.queryListByParentsId(0L);
        if(list!=null){
            return ResponseEntity.ok(list);
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
    }
}
