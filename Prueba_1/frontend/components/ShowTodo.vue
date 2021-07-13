<template>
    <div>
      <el-dialog
        title="Lista de todos"
        :visible.sync="visible"
        :before-close="hiddenDialog"
        width="70%">
        <el-row type="flex" :gutter="20">
          <el-col>
            <p>Datos</p>
            <div>
              <el-card align="center">
                <div>
                  <img :src="getUrlImage(user.id)" alt="">
                </div>
                <p>Nombre: {{ user.name }}</p>
                <p>Email: {{ user.email }}</p>
                <p>Username: {{ user.username }}</p>
              </el-card>
            </div>
          </el-col>
          <el-col>
            <p>Todo</p>
            <div>
              <div class="form-todo">
                <el-row>
                  <el-col :sm="12">
                    <p>Tarea</p>
                    <el-input v-model="form.title"></el-input>
                  </el-col>
                  <el-col :sm="6">
                    <div class="center-switch">
                      <p>Completado</p>
                      <el-switch v-model="form.completed"></el-switch>
                    </div>
                  </el-col>
                  <el-col :sm="6">
                    <div class="center-button">
                      <el-button :disabled="form.title.length < 1" @click="addTodo">Agregar Todo</el-button>
                    </div>
                  </el-col>
                </el-row>
              </div>
            </div>
            <div class="list-post" v-loading="$fetchState.pending">
              <el-card v-for="todo in todos"  v-bind:key="todo.id">
                <p><b>{{ todo.id +')'}}</b> {{ todo.title }}</p>
                <p></p>
              </el-card>
            </div>
          </el-col>
        </el-row>
        <span slot="footer" class="dialog-footer">
          <el-button @click="hiddenDialog">Cerrar</el-button>
        </span>
      </el-dialog>
    </div>
</template>

<script>
    let _ = require('lodash')
    export default {
        name: "ShowTodo",
        props: ['visible'],
        data(){
          return{
            todos: [],
            user: {},
            form: {
              title: "",
              completed: true
            }
          }
        },
        methods:{
           hiddenDialog(){
             this.$emit('isHidden')
           },
          getUrlImage(id){
            return 'https://i.pravatar.cc/150?img='+id;
          },
          async addTodo(){
            let response = await this.$axios.post(this.$config.MOCK_API + 'todos', this.form)
            if(response.status === 201){
              this.$notify({
                title: 'Todo',
                message: 'Guardado correctamente',
                type: 'success'
              });
              this.form = {
                title: "",
                completed: true
              }
            }

          }
        },
        async fetch(){
          this.user = this.$store.state.users.current_user
          let todo = await this.$axios.$get(this.$config.MOCK_API + 'todos/'+this.user.id+'/todos')
          this.todos = _.orderBy(todo, ['id'], ['desc'])
        }
    }
</script>

<style lang="scss">
  .list-post{
    max-height: 350px;
    overflow-y: scroll;
    .el-card{
      margin-top: 15px;
    }
  }
  .form-todo{
    padding: 15px 0;
    .center-switch{
      text-align: center;
    }
    .center-button{
      padding-top: 40px;
    }
  }
</style>
