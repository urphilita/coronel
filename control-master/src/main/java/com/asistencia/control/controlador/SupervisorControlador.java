package com.asistencia.control.controlador;

import com.asistencia.control.model.Supervisor;
import com.asistencia.control.servicio.SupervisorServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class SupervisorControlador {
    @Autowired
    private SupervisorServicio supervisorServicio;

    @RequestMapping("/")
    public String paginaDeInicio(Model model,@Param("palabraClave") String palabraClave){

        List<Supervisor> listaSupervisor = supervisorServicio.listAll(palabraClave);

        model.addAttribute("listaSupervisor",listaSupervisor);
        model.addAttribute("palabraClave",palabraClave);

        return "index";
    }

    @RequestMapping("/nuevo")
    public String mostrarFormularioDeRegistrar(Model modelo){
        Supervisor superv = new Supervisor();
        modelo.addAttribute("supervisor",superv);
        return "agregar";
    }

    @RequestMapping(value = "/guardar",method = RequestMethod.POST)
    public String guardarSupervisor(@ModelAttribute("supervisor") Supervisor supervisor){
        supervisorServicio.save(supervisor);
        return "redirect:/";
    }
}
