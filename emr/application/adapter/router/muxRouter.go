package router

import (
	"errors"
	"log"
	"net/http"
	"strings"

	"github.com/gorilla/mux"
	"github.com/heykidhealth/emr/infrastructure/utils"
)

type muxRouter struct{}

var muxDispatcher = mux.NewRouter()

func NewMuxRouter() Router {
	return &muxRouter{}
}

func (*muxRouter) GET(uri string, f func(w http.ResponseWriter, r *http.Request)) {
	muxDispatcher.HandleFunc(uri, f).Methods("GET")
}

func (*muxRouter) POST(uri string, f func(w http.ResponseWriter, r *http.Request)) {
	muxDispatcher.HandleFunc(uri, f).Methods("POST")
}

func (*muxRouter) PUT(uri string, f func(w http.ResponseWriter, r *http.Request)) {
	muxDispatcher.HandleFunc(uri, f).Methods("PUT")
}

func (*muxRouter) SERVE(port string) {
	log.Printf("Mux http listening on port %s", port)
	log.Println(http.ListenAndServe(port, muxDispatcher))
}

func (*muxRouter) GetParam(r *http.Request, param string) (string, error) {
	vars := mux.Vars(r)
	thisParam, ok := vars[param]
	if !ok {
		//err := "The parameter " + param + " does not exist"
		err := errors.New(utils.ERROR_PARAMETER_NOT_FOUND)
		return "", err
	}
	return strings.Trim(thisParam, " "), nil
}
