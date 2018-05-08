<template>
  <div>
    <app-navigation></app-navigation>
    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-12 col-md-3 col-lg-3">
          <status-app></status-app>
        </div>
        <div class="col-sm-12 col-md-9 col-lg-9">
          <app-content></app-content>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Header from './components/header.vue';
import Status from './components/stat.vue';
import Content from './components/topic-content.vue';
export default {
  components:{
    'app-navigation': Header,
    'status-app': Status,
    'app-content': Content
  },
  name: 'app',
  data () {
    return {

    }
  }
}
</script>

<style lang="scss">
*{
  margin: 0;
  padding: 0;
}
body, html{
  background-color: rgb(248, 248, 248) !important;
}
@import 'node_modules/bootstrap/scss/bootstrap.scss';
@import 'style/custom.scss';
</style>
