/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package AcademicNetwork;

/**
 *
 * @author davidcarrillomaldonado
 */
public class Mensaje {
    private int id;
    private int Rem;
    private int Des;
    private String descripcion;
    private String fecha;
    private String hora;
    private String estado;

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
     * @return the idRem
     */
    public int getRem() {
        return Rem;
    }

    /**
     * @param idRem the idRem to set
     */
    public void setRem(int Rem) {
        this.Rem = Rem;
    }

    /**
     * @return the Des
     */
    public int getDes() {
        return Des;
    }

    /**
     * @param Des the Des to set
     */
    public void setDes(int Des) {
        this.Des = Des;
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
     * @return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }
}
