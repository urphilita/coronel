package com.asistencia.control.servicio;

import com.asistencia.control.model.Supervisor;
import com.asistencia.control.repositorio.SupervisorRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupervisorServicio {
    @Autowired
    private SupervisorRepositorio supervisorRepositorio;

    public List<Supervisor> listAll(String palabraClave){
        if(palabraClave != null){
            return supervisorRepositorio.findAll(palabraClave);
        }
        return supervisorRepositorio.findAll();
    }

    public void save(Supervisor supervisor){

        supervisorRepositorio.save(supervisor);
    }


    public Supervisor get(long id){
        return supervisorRepositorio.findById(id).get();
    }

    public void delete(long id){
        supervisorRepositorio.deleteById(id);
    }
}

