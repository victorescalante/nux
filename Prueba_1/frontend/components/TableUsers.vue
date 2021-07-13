<template>
  <div>
    <el-table
      :data="users"
      style="width: 100%">
      <el-table-column
        prop="id"
        label="ID">
      </el-table-column>
      <el-table-column
        prop="name"
        label="Nombre">
      </el-table-column>
      <el-table-column
        prop="email"
        label="Email">
      </el-table-column>
      <el-table-column
        prop="username"
        label="Usuario">
      </el-table-column>
      <el-table-column
        label="Dirección">
        <template slot-scope="props">
          <p>{{ props.row.address.street }}, {{ props.row.address.suite }}, {{ props.row.address.city }}, </p>
        </template>
      </el-table-column>
      <el-table-column>
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="info"
            @click="ShowPost(scope.$index, scope.row)">posts</el-button>
          <el-button
            size="mini"
            type="danger"
            @click="ShowTodo(scope.$index, scope.row)">todos</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
    export default {
        props: ['users'],
        name: "TableUsers",
        methods: {
          ShowPost(index,row){
            this.$emit('showPost')
            this.$store.commit('users/setCurrentUser', row);
          },
          ShowTodo(index,row){
            this.$emit('showTodo')
            this.$store.commit('users/setCurrentUser', row);
          }
        }
    }
</script>

<style scoped>

</style>
