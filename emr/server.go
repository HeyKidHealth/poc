package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/heykidhealth/emr/application/adapter/router"
	"github.com/heykidhealth/emr/application/controller"
	"github.com/heykidhealth/emr/application/service"
	repository "github.com/heykidhealth/emr/core/repository/person"
)

var (
	postRepository   repository.PersonRepository = repository.NewPersonNeo4jRepository()
	personService    service.PersonService       = service.NewPersonService(postRepository)
	personController controller.PersonController = controller.NewPersonController(personService)
	httpRouter       router.Router               = router.NewMuxRouter()
)

func main() {
	//http server
	const port = ":8000"
	httpRouter.GET("/", func(w http.ResponseWriter, r *http.Request) {
		log.Printf("EMR Server running on port %s", port)
		fmt.Fprintln(w, "EMR Server running on port ", port)
	})

	httpRouter.GET("/person/{id}", personController.GetPerson)
	httpRouter.POST("/person", personController.AddPerson)

	httpRouter.SERVE(port)
}
