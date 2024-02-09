from django import forms

class CheckAvailabilityForm(forms.Form):
    check_in = forms.DateField(label="Arrival Date", widget=forms.DateInput(attrs={'type': 'date'}))
    check_out = forms.DateField(label="Departure Date", widget=forms.DateInput(attrs={'type': 'date'})) 