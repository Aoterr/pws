package com.sdsy.service;

import com.sdsy.entity.ItemCat;
import com.sdsy.service.base.BaseService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 郭帅 on 2016/12/15.
 */
@Service
public class ItemCatService extends BaseService<ItemCat> {
    public List<ItemCat> queryListByParentsId(long l) {
       ItemCat record = new ItemCat();
       record.setParentId(l);
        return this.queryListByWhere(record);

    }
}
