# Generated by Django 4.1.4 on 2023-03-24 03:01

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cuenta', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='transaccion',
            name='descricion',
            field=models.CharField(blank=True, max_length=300),
        ),
    ]
