<%@ page language="java" contentType="text/html; charset=ISO-8859-15" pageEncoding="ISO-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html lang="fr">
<head>
    <meta content="text/html; charset=iso-8859-15" http-equiv="content-type">
    <link href="${pageContext.request.contextPath}/css/stl_projet.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans|Roboto" rel="stylesheet">
    <meta content="width=device-width" name="viewport"/>
    <title>Le Site de L'escalade</title>
</head>
<body>
<div id="container">

    <header>
        <h1>Les amis de l'escalade</h1>
    </header>
    <main>
        <nav class="nav">
            <header>.</header>
            <section>
                <c:if test="${requestScope.saisieVoieOk ==true}" scope="request" var="none">
                    <button class="boutonLateral"
                            name="SelectionSecteur"
                            form="navSelectionSecteur"
                            type="submit"
                            formaction="SelectionSecteur"
                            formmethod="post"
                            value="SelectionSecteur"
                            formtarget="_self"> Selection Secteur
                    </button>
                </c:if>

                <c:if test="${requestScope.saisieLongueurOk ==true}" scope="request" var="none">
                    <button class="boutonLateral"
                            name="SelectionVoie"
                            form="navSelectionVoie"
                            type="submit"
                            formaction="SelectionVoie"
                            formmethod="post"
                            value="SelectionVoie"
                            formtarget="_self"> Selection Voie
                    </button>
                </c:if>


                <c:if test="${requestScope.boutonValiderOk ==true}" scope="request" var="none">
                    <button class="boutonLateral"
                            name="Valider"
                            form="xxx"
                            type="submit"
                            formaction="Valider"
                            formmethod="post"
                            value="Valider"
                            formtarget="_self"> Valider
                    </button>
                </c:if>

                <a class="boutonLateral" href="home">Vers l'Acceuil</a>
            </section>
            <footer>.</footer>
        </nav>
        <section>
                <c:if test="${requestScope.afficheFormeSpot == true}" scope="page" var="none">
                    <label for="formEnregistrerSpot" class="labels">Saisir infos Spot</label>
                    <form id="formEnregistrerSpot" class="formSimple">
                        <fieldset class="labels">
                            <label for="nomSpot"> nom : </label>
                            <label for="localisationSpot"> lieu : </label>
                        </fieldset>
                        <fieldset class="inputs">
                            <input id="nomSpot" name="nomSpot" required size="16" type="text"/>
                            <input id="localisationSpot" name="localisationSpot" required size="16" type="text"/>
                        </fieldset>
                        <fieldset class="actions">
                            <button class="boutonFormSimple"
                                    name="AjouterSpot"
                                    form="formEnregistrerSpot"
                                    type="submit"
                                    formaction="AjouterSpot"
                                    formmethod="post"
                                    value="AjouterSpot"
                                    formtarget="_self"> Ajouter
                            </button>
                        </fieldset>
                    </form>
                </c:if>
                <c:if test="${requestScope.saisieSecteurOk ==true}" scope="page" var="none">
                    <label for="formEnregistrerSecteur" class="labels">Saisir infos Secteur</label>
                    <form id="formEnregistrerSecteur" class="formSimple">
                        <fieldset class="labels">
                            <label for="nomSecteur"> nom : </label>
                        </fieldset>
                        <fieldset class="inputs">
                            <input id="nomSecteur" name="nomSecteur" required size="16" type="text"/>
                        </fieldset>
                        <fieldset class="actions">
                            <button class="boutonFormSimple"
                                    name="AjouterSecteur"
                                    form="formEnregistrerSecteur"
                                    type="submit"
                                    formaction="AjouterSecteur"
                                    formmethod="post"
                                    value="AjouterSecteur"
                                    formtarget="_self"> Ajouter
                            </button>
                        </fieldset>
                    </form>
                </c:if>
            <c:if test="${requestScope.saisieVoieOk ==true}" scope="page" var="none">
                <label for="formEnregistrerVoie" class="labels">Saisir infos Voies</label>
                <form id="formEnregistrerVoie" class="formSimple">
                    <fieldset class="labels">
                        <label for="nomVoie"> nom : </label>
                    </fieldset>
                    <fieldset class="inputs">
                        <input id="nomVoie" name="nomVoie" required size="16" type="text"/>
                    </fieldset>
                    <fieldset class="actions">
                        <button class="boutonFormSimple"
                                name="AjouterVoie"
                                form="formEnregistrerVoie"
                                type="submit"
                                formaction="AjouterVoie"
                                formmethod="post"
                                value="AjouterVoie"
                                formtarget="_self"> Ajouter
                        </button>
                    </fieldset>
                </form>
            </c:if>
        </section>
        <aside>
            <article>
                <label style="font-size: larger ">Spots</label>
                <table class="bordered">
                    <thead>
                    <tr>
                        <th> Nom</th>
                        <th> Localisation</th>
                        <th> Classification</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${not empty requestScope.dbSpot}" scope="page" var="non">
                        <tr>
                            <td>${requestScope.dbSpot.getNom()}</td>
                            <td>${requestScope.dbSpot.getLocalisation()}</td>
                            <td>${requestScope.dbSpot.getClassification()}</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </article>
            <article>
                <label style="font-size: larger ">Secteurs</label>
                <table class="bordered">
                    <thead>
                    <tr>
                        <th> #</th>
                        <th> Nom</th>
                    </tr>
                    </thead>
                    <tbody>
                    <form id="navSelectionSecteur">
                    <c:forEach var="dbSecteur" items="${requestScope.dbSpot.getSecteursByIdspot()}">
                        <tr>
                            <td><input type="radio" name="idValSecteur" required value="${dbSecteur.getIdsecteur()}"></td>
                            <td>${dbSecteur.getNom()}</td>
                        </tr>
                    </c:forEach>
                    </form>
                    </tbody>
                </table>
            </article>

            <article>
                <label style="font-size: larger ">Voies</label>
                <table class="bordered">
                    <thead>
                    <tr>
                        <th> #</th>
                        <th> Nom</th>
                    </tr>
                    </thead>
                    <tbody>
                    <form id="navSelectionVoie">
                        <c:forEach var="dbVoie" items="${requestScope.dbSecteur.getSecteursByIdspot()}">
                            <tr>
                                <td><input type="radio" name="idValSecteur" required value="${dbSecteur.getVoiesByIdsecteur()}"></td>
                                <td>${dbVoie.getNom()}</td>
                            </tr>
                        </c:forEach>
                    </form>
                    </tbody>
                </table>
            </article>
            <article>
                <label style="font-size: larger ">Longeurs</label>
                <table class="bordered">
                    <thead>
                    <tr>
                        <th>A</th>
                        <th>B</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>The Shawshank Redemption</td>
                        <td>1994</td>
                    </tr>
                    </tbody>
                </table>
            </article>
        </aside>
    </main>
    <footer>
        <h1>@2019 Projet 06</h1>
    </footer>
</div>
</body>
</html>
