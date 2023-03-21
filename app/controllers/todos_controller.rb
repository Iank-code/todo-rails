class TodosController < ApplicationController

    def get_todos
        render json: Todo.all
    end

    def create
        # title = params[:title]
        # description = params[:description]
        # priority = params[:priority]

        todo = Todo.create(body_params)
        if todo.valid?
            render json: todo
        else
            render json: todo.errors
        end
    end

    def update
        todo = Todo.find_by(id: params[:id].to_i)
        todo.update(body_params)
        render json: {message: "Update Successfully"}
    end

    def destroy
        todo = Todo.find_by(id: params[:id])
        todo.destroy

    end


    private
    def body_params
        params.permit(:title, :description, :priority, :status)
    end
end
