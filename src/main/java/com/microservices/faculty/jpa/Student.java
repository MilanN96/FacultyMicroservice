package com.microservices.faculty.jpa;
import java.io.Serializable;
import javax.persistence.*;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString(includeFieldNames=true)
@NamedQuery(name="Student.findAll", query="SELECT s FROM Student s")
public class Student implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @SequenceGenerator(name="STUDENT_ID_GENERATOR", sequenceName="STUDENT_SEQ", allocationSize = 1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="STUDENT_ID_GENERATOR")
    private Integer id;

    @Column(name="broj_indeksa")
    private String brojIndeksa;

    private String ime;

    private String prezime;

    //bi-directional many-to-one association to Departman
    @ManyToOne
    @JoinColumn(name="departman")
    private Departman departman;

    //bi-directional many-to-one association to Status
    @ManyToOne
    @JoinColumn(name="status")
    private Status status;

}
