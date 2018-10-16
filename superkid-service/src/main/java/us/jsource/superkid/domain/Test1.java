package us.jsource.superkid.domain;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tests")
@Data
public class Test1 {
    @Id
    @Column
    private String testField1;

    @Column
    private String testField2;

    @Column
    private boolean isOk;
}
