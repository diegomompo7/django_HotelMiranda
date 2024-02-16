let select = document.querySelector('select[name="order_rooms"]');
    
select.addEventListener('change', function() {
    document.getElementById('orderForm').submit();
});