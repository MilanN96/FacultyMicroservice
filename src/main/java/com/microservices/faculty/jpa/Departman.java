package com.microservices.faculty.jpa;

import javax.persistence.*;
import java.io.Serializable;
import lombok.*;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@ToString(includeFieldNames=true)
@NamedQuery(name="Departman.findAll", query="SELECT d FROM Departman d")
public class Departman implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @SequenceGenerator(name="DEPARTMAN_ID_GENERATOR", sequenceName="DEPARTMAN_SEQ", allocationSize = 1)
    @GeneratedValue(strategy=GenerationType.SEQUENCE, generator="DEPARTMAN_ID_GENERATOR")
    private Integer id;

    private String naziv;

    private String oznaka;

    //bi-directional many-to-one association to Fakultet
    @ManyToOne
    @JoinColumn(name="fakultet")
    private Fakultet fakultet;

    //bi-directional many-to-one association to Student
    @OneToMany(mappedBy="departman")

    @JsonIgnore
    private List<Student> students;
}
