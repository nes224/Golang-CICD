package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func main() {
	server := gin.Default()
	router := server.Group("/api")
	router.GET("/", func(ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H{"status": "success", "message": "dev"})
	})
	server.Run(":" + "8000")
}
