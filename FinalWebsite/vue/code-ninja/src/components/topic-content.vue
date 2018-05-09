<template>
  <div class="container mt-5">

  </div>
</template>

<script>
import Status from './stat.vue';
export default {
  components:{
    'nest' : Status
  },
  name: 'app',
  data () {
    return {

    }
  }
}
</script>

<style scoped="true" lang="scss">
.container{
  height: 100rem;
  background-color: rgb(255, 255, 255) !important;
}
</style>
