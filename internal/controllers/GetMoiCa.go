package controllers

import (
// 	"github.com/gorilla/mux"
	"net/http"
// 	"serveur/internal/repository"
)

func GetMoiCa(w http.ResponseWriter, r *http.Request) {

	_, _ = w.Write([]byte("Le serveur a bien démarré."))
}
