myApp = angular.module('decoProteste',['ngRoute','ngResource']);

myApp.factory('Products', ['$resource',function($resource){
 return $resource('/products.json', {},{
 query: { method: 'GET', isArray: true },
 create: { method: 'POST' }
 })
}]);
 
myApp.factory('Product', ['$resource', function($resource){
 return $resource('/users/:id.json', {}, {
 show: { method: 'GET' },
 update: { method: 'PUT', params: {id: '@id'} },
 delete: { method: 'DELETE', params: {id: '@id'} }
 });
}]);





//ROTAS


myApp.config([
 '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
 $routeProvider.when('/products',{
    templateUrl: '/templates/products/index.html',
    controller: 'ProductsCtrl'
 });
 $routeProvider.when('/products/new', {
   templateUrl: '/templates/products/new.html',
   controller: 'ProductNewCtrl'
 });
 $routeProvider.when('/products/:id/edit', {
   templateUrl: '/templates/products/edit.html',
   controller: "ProductUpdateCtrl"
 });
 $routeProvider.otherwise({
   redirectTo: '/products'
 });
 }
]);





///CONTROLADORES

myApp.controller("ProductsCtrl", ['$scope', '$resource', 'Products', 'Product', '$location', function($scope, $resource, Products, Product, $location) {
  

  $scope.teste = "okok";
  $scope.Products = Products.query(); 
}]);


























