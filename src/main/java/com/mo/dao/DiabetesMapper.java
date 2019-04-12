package com.mo.dao;

import com.mo.entity.Diabetes;

public interface DiabetesMapper {
    int insert(Diabetes record);

    int insertSelective(Diabetes record);
}