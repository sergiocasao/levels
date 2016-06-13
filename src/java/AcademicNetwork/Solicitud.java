/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package AcademicNetwork;

/**
 *
 * @author Alan
 */
public class Solicitud {
    private int id;
    private int idProf;
    private String descripcion;
    private String titulo;
    private String fecha;
    private String hora;
    private String status;
    private int idProfSegAdmin=0;
    private String segAdmin="";
    private int idProfSegCCB=0;
    private String segCCB="";
    private int idProfSegQA=0;
    private String segQA="";

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the idProf
     */
    public int getIdProf() {
        return idProf;
    }

    /**
     * @param idProf the idProf to set
     */
    public void setIdProf(int idProf) {
        this.idProf = idProf;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the titulo
     */
    public String getTitulo() {
        return titulo;
    }

    /**
     * @param titulo the titulo to set
     */
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    /**
     * @return the fecha
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    /**
     * @return the hora
     */
    public String getHora() {
        return hora;
    }

    /**
     * @param hora the hora to set
     */
    public void setHora(String hora) {
        this.hora = hora;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the idProfSegAdmin
     */
    public int getIdProfSegAdmin() {
        return idProfSegAdmin;
    }

    /**
     * @param idProfSegAdmin the idProfSegAdmin to set
     */
    public void setIdProfSegAdmin(int idProfSegAdmin) {
        this.idProfSegAdmin = idProfSegAdmin;
    }

    /**
     * @return the segAdmin
     */
    public String getSegAdmin() {
        return segAdmin;
    }

    /**
     * @param segAdmin the segAdmin to set
     */
    public void setSegAdmin(String segAdmin) {
        this.segAdmin = segAdmin;
    }

    /**
     * @return the idProfSegCCB
     */
    public int getIdProfSegCCB() {
        return idProfSegCCB;
    }

    /**
     * @param idProfSegCCB the idProfSegCCB to set
     */
    public void setIdProfSegCCB(int idProfSegCCB) {
        this.idProfSegCCB = idProfSegCCB;
    }

    /**
     * @return the segCCB
     */
    public String getSegCCB() {
        return segCCB;
    }

    /**
     * @param segCCB the segCCB to set
     */
    public void setSegCCB(String segCCB) {
        this.segCCB = segCCB;
    }

    /**
     * @return the idProfSegQA
     */
    public int getIdProfSegQA() {
        return idProfSegQA;
    }

    /**
     * @param idProfSegQA the idProfSegQA to set
     */
    public void setIdProfSegQA(int idProfSegQA) {
        this.idProfSegQA = idProfSegQA;
    }

    /**
     * @return the segQA
     */
    public String getSegQA() {
        return segQA;
    }

    /**
     * @param segQA the segQA to set
     */
    public void setSegQA(String segQA) {
        this.segQA = segQA;
    }
    
}
