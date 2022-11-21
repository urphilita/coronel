package com.asistencia.control.model;

import javax.persistence.*;

@Entity
public class Supervisor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(nullable = false,length = 30)
    private String nombre;
    @Column(nullable = false,length = 30)
    private String appaterno;
    @Column(nullable = false,length = 30)
    private String apmaterno;
    @Column(nullable = false)
    private int ci;
    @Column(nullable = false,length = 30)
    private String contrasenia;

    public Supervisor(long id, String nombre, String appaterno, String apmaterno, int ci, String contrasenia) {
        this.id = id;
        this.nombre = nombre;
        this.appaterno = appaterno;
        this.apmaterno = apmaterno;
        this.ci = ci;
        this.contrasenia = contrasenia;
    }

    public Supervisor() {
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAppaterno() {
        return appaterno;
    }

    public void setAppaterno(String appaterno) {
        this.appaterno = appaterno;
    }

    public String getApmaterno() {
        return apmaterno;
    }

    public void setApmaterno(String apmaterno) {
        this.apmaterno = apmaterno;
    }

    public int getCi() {
        return ci;
    }

    public void setCi(int ci) {
        this.ci = ci;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }
}
