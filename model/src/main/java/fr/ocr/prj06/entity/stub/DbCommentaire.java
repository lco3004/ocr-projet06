package fr.ocr.prj06.entity.stub;

import fr.ocr.prj06.entity.common.JpaConvBoolInt;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;


@Entity
@Table(name = "commentaire", schema = "ocr_projet06")
public class DbCommentaire implements Serializable {

    private static final long serialVersionUID = 1L;

    private int idcommentaire;
    private String texte;

    @Convert(converter = JpaConvBoolInt.class)
    private Boolean estVisible;

    private DbSpot spotBySpotIdspot;

    @Id
    @Column(name = "idcommentaire")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getIdcommentaire() {
        return idcommentaire;
    }

    public void setIdcommentaire(int idcommentaire) {
        this.idcommentaire = idcommentaire;
    }

    @Basic
    @Column(name = "texte",length = 256)
    public String getTexte() {
        return texte;
    }

    public void setTexte(String texte) {
        this.texte = texte;
    }

    @Basic
    @Column(name = "est_visible")
    public Boolean getEstVisible() {
        return estVisible;
    }

    public void setEstVisible(Boolean estVisible) {
        this.estVisible = estVisible;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DbCommentaire that = (DbCommentaire) o;
        return idcommentaire == that.idcommentaire &&
                estVisible == that.estVisible &&
                Objects.equals(texte, that.texte);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idcommentaire, texte, estVisible);
    }

    @ManyToOne(cascade = CascadeType.PERSIST )
    @JoinColumn(name = "spot_idspot", referencedColumnName = "idspot")
    public DbSpot getSpotBySpotIdspot() {
        return spotBySpotIdspot;
    }

    public void setSpotBySpotIdspot(DbSpot spotBySpotIdspot) {
        this.spotBySpotIdspot = spotBySpotIdspot;
    }

    /**
     * @return
     */
    @Override
    public String toString() {
        return (new StringBuilder(1024))
                .append("idCommentaire: ").append(getIdcommentaire())
                .append(" idSpot: ").append(getSpotBySpotIdspot().getIdspot())
                .append(" estVisible: ").append(getEstVisible())
                .append(" texte: ").append(getTexte())
                .toString();
    }
}
