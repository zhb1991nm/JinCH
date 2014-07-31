package com.jinch.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * Created by 敏华 on 2014/7/30.
 */
@MappedSuperclass
public class BaseEntity {
    @Id
    @Column(name="data_id",length=32)
    protected String dataId;
}
