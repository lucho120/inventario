$(document).ready(function () {
	load(1);
});

function load(page) {
	var q = $("#q").val();
	$("#loader").fadeIn('slow');
	$.ajax({
		url: './ajax/buscar_mantenimiento.php?action=ajax&page=' + page + '&q=' + q,
		beforeSend: function (objeto) {
			$('#loader').html('<img src="./img/ajax-loader.gif"> Cargando...');
		},
		success: function (data) {
			
			$(".outer_div").html(data).fadeIn('slow');
			$('#loader').html('');

		}
	})
}



function eliminar(id) {
	var q = $("#q").val();
	if (confirm("Realmente deseas eliminar la mantenimiento")) {
		$.ajax({
			type: "GET",
			url: "./ajax/buscar_mantenimiento.php",
			data: "id=" + id, "q": q,
			beforeSend: function (objeto) {
				$("#resultados").html("Mensaje: Cargando...");
			},
			success: function (datos) {
				$("#resultados").html(datos);
				load(1);
			}
		});
	}
}



$("#guardar_mantenimiento").submit(function (event) {
	$('#guardar_datos').attr("disabled", true);

	var parametros = $(this).serialize();
	$.ajax({
		type: "POST",
		url: "ajax/nuevo_mantenimiento.php",
		data: parametros,
		beforeSend: function (objeto) {
			$("#resultados_ajax").html("Mensaje: Cargando...");
		},
		success: function (datos) {
			
			$("#resultados_ajax").html(datos);
			$('#guardar_datos').attr("disabled", false);
			load(1);
		}
	});
	event.preventDefault();
})

$("#editar_mantenimiento").submit(function (event) {
	$('#actualizar_datos').attr("disabled", true);

	var parametros = $(this).serialize();
	
	$.ajax({
		type: "POST",
		url: "ajax/editar_mantenimiento.php",
		data: parametros,
		beforeSend: function (objeto) {
			$("#resultados_ajax2").html("Mensaje: Cargando...");
		},
		success: function (datos) {		
			$("#resultados_ajax2").html(datos);
			$('#actualizar_datos').attr("disabled", false);
			load(1);
		}
	});
	event.preventDefault();
})


$('#myModal2').on('show.bs.modal', function (event) {
	var button = $(event.relatedTarget) // Button that triggered the modal
	console.log(button);
	var codigo = button.data('nombre')
	var descripcion = button.data('descripcion')
	var fecha_mantenimiento = button.data('fecha_mantenimiento')
	var id = button.data('id')
	var modal = $(this)
	modal.find('.modal-body #mod_codigo').val(codigo)
	modal.find('.modal-body #mod_descripcion').val(descripcion)
	modal.find('.modal-body #mod_fecha_mantenimiento').val(fecha_mantenimiento)
	modal.find('.modal-body #mod_id').val(id)
})


