package com.efeiyi.ec.organization.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;

/**
 * User: Kyll
 * Time: 2008-7-3 15:27:28
 */
@Entity
@Table(name = "organization_address_district")
@JsonIgnoreProperties(value = {"hibernateLazyInitializer", "handler", "city"})
public class AddressDistrict implements Serializable {
    private Integer id;
    private String name;
    private AddressCity addressCity;

    @Id
    @GenericGenerator(name = "id", strategy = "increment")
    @GeneratedValue(generator = "id")
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "opened_city_id")
    public AddressCity getAddressCity() {
        return addressCity;
    }

    public void setAddressCity(AddressCity addressCity) {
        this.addressCity = addressCity;
    }
}