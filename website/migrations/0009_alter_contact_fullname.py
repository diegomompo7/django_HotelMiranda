# Generated by Django 3.2.12 on 2024-02-12 11:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('website', '0008_contact_fullname'),
    ]

    operations = [
        migrations.AlterField(
            model_name='contact',
            name='fullName',
            field=models.CharField(max_length=256),
        ),
    ]
