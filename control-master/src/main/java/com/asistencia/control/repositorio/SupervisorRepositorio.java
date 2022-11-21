package com.asistencia.control.repositorio;

import com.asistencia.control.model.Supervisor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SupervisorRepositorio  extends JpaRepository<Supervisor,Long> {
    @Query("SELECT p FROM Supervisor p WHERE p.nombre LIKE %?1% OR p.appaterno LIKE %?1%")

    public List<Supervisor> findAll(String palabraClave);
}

