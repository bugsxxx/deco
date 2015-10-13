

angular.module('decoProteste', ['ui.router','ngResource'])


/*
.factory('Prods', ['$resource',function($resource){
 Prod = $resource("/products/:id", {id: "@id"},{update:"PUT"});
 
}])*/

.factory('Prods', ['$resource',function($resource){
	return $resource('/products.json', {},{
 	query: { method: 'GET', isArray: true },
 	create: { method: 'POST' }
 		})
	}])

.factory('Prod', ['$resource', function($resource){
			 return $resource('/products/:id.json', {id:'@_id'}, {
			 show: { method: 'GET' },
			 update: { method: 'PUT' },
			 delete: { method: 'DELETE' }
			 });
}])





.config(['$stateProvider','$urlRouterProvider',function($stateProvider, $urlRouterProvider) {

  $stateProvider.state('products', {
      url: '/products',
      templateUrl: '/templates/products/index.html',
      controller: 'ProductsCtrl'
    })

    $stateProvider.state('newProd', {
      url: '/products/new',
      templateUrl: '/templates/products/new.html',
      controller: 'ProductNewCtrl'
    })

    $stateProvider.state('updateProd', {
      url: '/products/:id/update',
      templateUrl: '/templates/products/edit.html',
      controller: 'ProductNewCtrl'
    })



    ;


  $urlRouterProvider.otherwise('products');
}])





.controller('ProductsCtrl', ['$scope','$resource','Prods','$http','$location','Prod', function($scope, $resource, Prods, $http, $location, Prod){
  $scope.teste = 'Hello world!';

 $scope.mostra="show";
 
  var input = "";


  var products = Prods.query();
  $scope.res = products;

  console.log($scope.produtos);


  $scope.search = function(){

  	input = $scope.query1;

  	if (input) {

  		$http({
			  method: 'POST',
			  url: '/products/search',
			  data: {"query": input}
			}).then(function successCallback(response) {
				$scope.res = response.data.data;
				console.log($scope.res)
				
			    // this callback will be called asynchronously
			    // when the response is available
			  }, function errorCallback(response) {
			  	alert('erro');
			  	$scope.res = products;
			    // called asynchronously if an error occurs
			    // or server returns response with an error status.
			  });

			}
			else{	
			$scope.res = products;

						};

  }




  		$scope.sidekiq = function(){
  			
  			$scope.mostra="showtrue";
  		}


  		$scope.sidekiqnew = function(){
  			alert('ok');
  		}


  		
  			

  			$scope.deleteProd = function (prodId) {

  				//alert(prodId);
  				//console.log(prodId);
			    if (confirm("Are you sure you want to delete this prouct?")){
			      Prod.delete({ id: prodId }, function(){
			        $scope.prods = Prods.query();   // after delete user get users collection.
			        window.location.href ='/';
			    		});
    			}
  			};
  		
  			$scope.showProd = function (prodId) {

  				//alert(prodId);


  				
			     $scope.pro = Prod.show({id: prodId});
    			

  			}

  			$scope.editProd = function(prodId){
  				$scope.pro = Prod.show({id: prodId});
  				//alert('1');
  			}

  			$scope.update = function(){
  				//alert('ok');
  				Prod.update($scope.pro.data,function(){
		        	$location.path('/');}, function(error) {
		         console.log(error)
		      });
  			}


  			$scope.newProd = function(product){

  				//alert('ok');
  				 Prods.create({product}, function(){
			     
			    }, function(error){
			      console.log(error)
			    });

  				  window.location.href ='/';
  			}


  			$scope.sideTeste = function(sidekiqexemplo){


  					//alert(sidekiqexemplo.tipo+sidekiqexemplo.codigo);

  					$http({
					  method: 'POST',
					  url: '/sidekiqexemplos',
					  data: {sidekiqexemplo}
					}).then(function successCallback(response) {
						
					 t = response.data;
					 //$scope.r = t;

					 


					 url = '/sidekiqexemplos/'+t.data._id.$oid;
					 //alert(url);
					
						
					window.location.href = (url);
						//console.log($scope.res)
						
					    // this callback will be called asynchronously
					    // when the response is available
					  }, function errorCallback(response) {
					  	alert('erro');

					  	//$scope.res = products;
					    // called asynchronously if an error occurs
					    // or server returns response with an error status.
					  });

 					
 			}





  			

}])



.controller('SideKiqCtrl', ['$scope','$resource','Prods','$http','$location','Prod', function($scope, $resource, Prods, $http, $location, Prod){
 			
		$scope.backProds = function(){
 				//alert('ok');
 				window.location.href = '/';
 			}
 			

 }])

;
























