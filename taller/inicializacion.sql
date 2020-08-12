use Taller;
go

INSERT INTO [dbo].[Sucursal] ([nombre],[ubicacion]) VALUES
('A',geography::STGeomFromText('POINT(123.33 45.123)',4326)),('B',geography::STGeomFromText('POINT(98.254 12.001)',4326)),('C',geography::STGeomFromText('POINT(43.43 43.43)',4326))
GO

insert into dbo.Puesto (descripcion) values
('Empleado'),('Supervisor'),('Tecnico'),('Conserje'),('Jefe')
GO

--Empleados
insert into dbo.Empleado (nombre, apellido, fechaContratacion, foto, salario, idPuesto) values
('Ulrika', 'Silley', '2012-11-27', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAHdSURBVDjLpZNraxpBFIb3a0ggISmmNISWXmOboKihxpgUNGWNSpvaS6RpKL3Ry//Mh1wgf6PElaCyzq67O09nVjdVlJbSDy8Lw77PmfecMwZg/I/GDw3DCo8HCkZl/RlgGA0e3Yfv7+DbAfLrW+SXOvLTG+SHV/gPbuMZRnsyIDL/OASziMxkkKkUQTJJsLaGn8/iHz6nd+8mQv87Ahg2H9Th/BxZqxEkEgSrq/iVCvLsDK9awtvfxb2zjD2ARID+lVVlbabTgWYTv1rFL5fBUtHbbeTJCb3EQ3ovCnRC6xAgzJtOE+ztheYIEkqbFaS3vY2zuIj77AmtYYDusPy8/zuvunJkDKXM7tYWTiyGWFjAqeQnAD6+7ueNx/FLpRGAru7mcoj5ebqzszil7DggeF/DX1nBN82rzPqrzbRayIsLhJqMPT2N83Sdy2GApwFqRN7jFPL0tF+10cDd3MTZ2AjNUkGCoyO6y9cRxfQowFUbpufr1ct4ZoHg+Dg067zduTmEbq4yi/UkYidDe+kaTcP4ObJIajksPd/eyx3c+N2rvPbMDPbUFPZSLKzcGjKPrbJaDsu+dQO3msfZzeGY2TCvKGYQhdSYeeJjUt21dIcjXQ7U7Kv599f4j/oF55W4g/2e3b8AAAAASUVORK5CYII=', 90.6993, 4),
('Dolores', 'Bauldry', '1989-12-16', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAFySURBVDjLpZM9a1RhEIWf7C6mWASLSEBsbUWb/AdrW8HKRrC3EgWttbCzUgQRtRK0ERVEm/Q2aiPoBtJEosZ7Z+Yci3tvdosgKxkY5m3eZ77OrNjmMDYBePhu55rNpbJOSqIEKVElSiZLC15UmpI2b104tTEBkH3l/MbRtf/JfP3x59P7FZS0BjB9dhlsqAQVRHTvtoFooQmI4NfV10TU6gJgmIPhxHFQdu7sIQ1EA9nCxxkAkTWfQZV6wAp83warq0TqKqkhAuvrALQ9ANvcfTnzz72wbd9/M/tnfPLhm7d/7Pni7U3bZgQQJbTkOpswu7+DNroKRkMLy6qhyaINkak5IEpYSwJC/bgXASmWVWT0maerkzkgpaUFNACGzU0AMhMDD95uMR51UTb3Xs2IKu68+Eobxc2nXzgy7j6ORwu3ENW1cO7sMbIG7Xv/Fg4yqZtaLyS/v/Ho05m2NI0sIotKESWy8kDAzu6f5wArhz3nv90eObvZ0Hw1AAAAAElFTkSuQmCC', 68.1146, 4),
('Clarey', 'Allison', '2007-05-22', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALCSURBVDjLjZP/SxNxGMf9B/QfiVB/ytCaoS7MDEoMYlgswi+FkzQsjNZQNKX1g0s3ZkTppuB+smJSOnOiGTa1lLHt5rZ0c05trX29fblt7+5zdJIK0cHD57mHz+t1z3P3uRwAOX/H4uJisdFoHJienl7V6/U/JiYmful0Okqr1apGNarSo/sPEpPJlMvCShZOud1uBAIBhMNhxGIxhEIhWK0WqAa7GbWySzOg6M07JPgDv3c6nchms4jH4yCSra0t+P1+pNNpZNM0GJqC0TCGp33353ufPMo7EJAnEziVSoFcDMOA3DscDgSDQU6apHeQiFqQSWxgavI1Oh83azgBCxexbWei0SgHRCIRTuL1emGz2UDq6TSDWMiGZNTKdZFio/VuY+Ze253iHBZWejwekKAoioPIzETk8/m4PJkIsQIzC7rZ/CfbYRLz8/NoaGhQ5hQUFOB/orCwAL6FZ/BONcG3rIHL5YJYLP7GCcxmM+x2OxYWFjAyMsIBZN3e3ubqJO8QnYR/qQVMZAm+GTE2l99AJBL5OQHZxENEQoLU+Lp9dhB7xjowQQ2CZhn8n6Vwjl5Fe11Z5JiABA/zdce7ZiQD40jsSJHYHUJwTQraLcP6QGnm2Ai8iKz8CLMvGxF19oHevI24uw309xug7bVYkp5O/fMlXqnIh6H/HFbHLiJMXQe9cQlxpwgxG4Hz0VNzQsodJIVCoZybm8NukP2U3nVYtr7C8mkAdl0t26oaMUcNaEqIlednsSYXwtQtQMvlU4aDkyiXy3O7ejoN42+1cO1bOYlLL2ZnHkZ4vQi05TxWVGwnk8N4NaRClbDso0AgyD30M8lkstwHD9tfNEnqmYkPOjgnbyK514MYVY3lwVIM97ei8kJlqry8XMnDhwR8SCTNJfVNt9RDHRX7X9TC7ExPSUZy7YynqrpSzcLFR/f/BmKF4lxymSkBAAAAAElFTkSuQmCC', 55.1038, 3),
('Archibald', 'Kinchley', '2020-01-19', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ8SURBVBgZBcHda5V1AADg5/d73/d42g66bF8ZTgbbxcpoKaNJXWQ3fUJJdRF5JxRF5EGEboIZ/QPiTeFNGF03GFiRUSZiUGxlSlnqtsZya6ustY9z3vPx9jyhfkRXacCEVBVARARABAA0ccvJfME7aWnAhOGDVX37STJiSgjEQIjEQAxICAgoWtz6rlr6ZEoqVdW3n3pC/xgJVn7izxliJImIJAiRoqDSTe8+eqeqKUgyYpkHDwEO0djg+jlunKW1jkBRIHB7mfJdtInaCCmbS1yZZPYiG6tkndz7HE+eYtc4INBoUGvQzMlJRcTA5hJXPyIG0kj3KKOH2THAQ0eZOc2Nc9Sb5HUaLWpEERH9Y7zwIY+9y9CzrM3y5VssXAD2vULfKPU6tSaNJjlRGxICsk56RnjgZZ44Rdcg0+8zfx44cJRiG7UGjRY1ooiAvy/z6ZtMn2ZjlayDR96mcg8XTrK+TKnC3meoNWm0yUlFxEgR2Vph4SuWvuX+w+x5lAPH+fgNi++9ZvHarzZ+uy4rp3avtw3mpNoQSArGj5NVWPiamQ/oHqHSZ3EluL2ybPT5I7YN3mfrx8/9fPEL6WYUQSzo2cuuMXpG2P0wa/9wZRLMTX9j6OCLyjfPC2de0jE7ac/ATvONIAUCWys0Nsk6WL1Jvc7vv4B89Q/l/kGeOgYgPXG3vB2kchRNtPjsGNkOFi5TbzL7PWdelXWWbf5wVufU6+pbyzbx31oiTUhODOvSf8e4O4cpVYgF23vZ0UdXHzEKMTN/7aqYRY1kw79/FeaWEt3t9qVQf1xXqd+EflVtNFFDjhw1NFm03dz6hrwVZElhZywuDa20n/4fCNbrcsCV4KMAAAAASUVORK5CYII=', 74.2157, 1),
('Dex', 'York', '2014-05-09', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALnSURBVDjLfZNLaFx1HIW/e2fuzJ00w0ymkpQpiUKfMT7SblzU4kayELEptRChUEFEqKALUaRUV2YhlCLYjYq4FBeuiqZgC6FIQzBpEGpDkzHNs5PMTJtmHnfu6//7uSh2IYNnffg23zmWqtIpd395YwiRL1Q0qyIfD56cmOvUs/4LWJg40auiH6jI+7v3ncybdo2Hy9ebKvqNGrn03Nj1+x0Bi1dHHVV9W0U+ye4d2d83+Ca2GJrlGZx0gkppkkfrsysqclFFvh8++3v7CWDh6ugIohfSPcPH+w6fwu05ABoSby9yb3Kc/mePYXc9TdCqslWapVGdn1Zjxo++O33Fujtx4gdEzj61f8xyC8/jN2rsVOcxYZOoVSZtBewZOAT+NonuAWw3S728wFZpFm975cekGjlz8NXLVtSo0SxPImGdtFfFq5epr21wdOxrnMwuaC2jrRJWfYHdxRfIFeDWr0unkyrSUqxcyk2TLQzQrt6hqydPvidDBg/8VTAp8DegvYa3OU1z+SbuM6dQI62kioAAVgondwAnncWvzCDNCk4CLO9vsJVw8xqN+iPiTB5SaTSKURGSaoTHHgxoAMlduL1HiFMZXP8BsvkbO1GD2O3GpLOIF0KsSBijxmCrMY+FqgGJQDzQgGT3XrJ7DuI5EKZd4iDG+CHG84m8AIki1Ai2imRsx4FEBtQHCUB8MG1wi8QKGhjEC4mbAVHTx8kNYSuoiGurkRtLN76ivb0K6SIkusCEoBEgaCQYPyT2QhKpAXKHTiMmQ2lmChWZTrw32v9TsLOyVlu8Nhi2G4Vs32HsTC9IA2KPRuU2Erp097+O5RRYvz3H1r3JldivfY7IR0+mfOu7l3pV5EM1cq744mi+OPwaRD71tSk0Vsp3/uLB6s2minyrIpeOf7a00fFMf1w+MqRGzqvIW/teecdqV5a5P/8ncXv9ZxUdf/lCae5/3/hvpi4OjajIp4ikVOTLY+cXr3Tq/QPcssKNXib9yAAAAABJRU5ErkJggg==', 51.5619, 2),
('Tamas', 'Goscar', '1989-12-23', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAMtSURBVDjLVZNLa1xlAIafc5szk8xkMkkm5MKY2EpT2qa2MTVCmoLS2gq6EKooimAW7iQb/0I2bgTRIog0oFW7KQpCS7VqrSmmJGlSQtswqWlLLmbGmcmcZM6cy/edz00r6bt8eXh4N6+mlGJnxiZHR4APgSNAFjCBKjClInXm05Gzl3by2mPB2OSoCUwAp1/LHbcziSyO24gbgJAegg2urF8UUsifhZBvfvXK99v/C8YmRy3gt8G2/cMv517E8Wx8ApYcjZiyKbkRSgQkcFn3rzG9Nn1LhOLYt2/8UNUfLZkYaN0zfLRrkLIMCHUNIXTqIoZLjLJvU/ASrFQtnko+z2BH38HAD78DMConHh4FPn5nz6vGgqyxTp16JNj2kpR9C8eD/OoW1VoNO1NCS+d5oW0vV27f2PX11MS8MTR6+JOTXUMHNCPBui5AtdMpk8xsGNQ9ndur20TxCnbPIn5TnmJUwaxIDrTm9Jn7d1tM4EiuqZs5d41iXGefsZsIwYNCgOfVSXconJbLLEWb4CuahU2+6HO8d4DQF/0m0NpgNvLAXaPgu6QadrEZpKhUItJZj/aMS1EewvHnsdUWW/+WKG82kEykCAPRbCqlNE1B4DsocpiW5OJfIVoiyfqSQFdNdGXrpLZGcFZDPKYJg2VQCiGEZkoRlZ3A6W41mknFn2WlaOKFFrG4Tbw9wb2/S3g3miHySLdbNDd2kzYKVGpVpIiqugjF7P3yQ55pyLFWmCSyVokZPqHnEoYmsWQGuyWOGdexNIkRFOnqbGN5bRngjh4G4rMLd6+KnmQW012lWrpOJuNjCh9LU9i6gRkEZHIrpNv/QK8vcijXz5lfLijgS+PmuYV75+fPDXr1Wt9znfsouy5x+2miuoltW1iawBJV0o0/wT8lBvbv5WZ+gaWNlasz43MfmQChH777e37uT78eHDx5+BiLBROjqhDaFmGkQ1KS6+mlr7+XX2evc+nWVB54+4kznfr8pZQIxXkRyhPvDb9vIjtQqgFN12hLO2yUZ/ni8o8SuAa8NTM+t/GE4HGGx4del0J+IGXUH8ko86iuAneAszPjc9/s5P8DuO6ZcsXuRqAAAAAASUVORK5CYII=', 76.4222, 3),
('Domenic', 'Bleackly', '2005-04-16', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJ9SURBVDjLjZHdS1NhHMcF/4G8FgoWEQgVIhFKkNZC7CLadL0osxwy1CbNt522JAzfljrb9Ax1LtfUTTcSCkTCJV3VRe2it4vV2Vp7zs45bpAXkZAv9O05A6E3bRe/qx/fz+f7e54cADnlY6LmLJuMKUd5qF0izgwTFPbErfLuf5NT7hQV58dFlA6TWMkgyTveG7de84gouBULZQUotRPFSRsJFfcnGGpljt6Oh6+MJ3GwncuuAbVqqDVWNpSQrWHDjISSO5+Qb4goswKcHk6AWtcOm7kiatVogyNQeXs3dI8v52YF0DiTOMRwaweMHFM5O/TV/sqKwRfdUHvqnqndFbkVjrLEzYfiABMUHKaA9L49IJIWv0CM04TNAKg1tt/4AfnXI2H1g56X1uddWIo+QueTDtDw+qne4i1TQJDa54VvI6E0RpdTuLsowTD1eTUD+LNS9ZxqwLLUgoWIH753UzhhKdxuC6YVRr+weWOa33Y+XUNHII0Gr6T8J0Aeat6YfjuJ+6+dOGYs+G70S1yzl2w0echy/+IXtPpTqHfvAqBhgdaWzXIY5/r6tjqDSTS642+o1WwOpmGaT6HOJTK7NtiZZl+qqHVWQMNkfFPvFiqplWmj9lbfKrROYW9A00wqr9Er8l1BHvXO6IKO5TLfqh0TYKKQ6lF+Yk8ArWs1+xLQsdH1Oge3Umv/uFJji6wYXHGY51K4aOdDuwL0U5K+w0erj8dAg0d+3V2y87BQQJWNhP8C6D1SXuZOeuNVB/dDa48GalhhXybo4BXUyjS4BHQvpFHLJnFhgCh/A+gmRT19XdTSO2tYIt8JGiySd1X3+IlKG4FqiMjBnZn4CaGVtXQxzDRMAAAAAElFTkSuQmCC', 71.8972, 2),
('Idette', 'Bloan', '2015-08-21', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAG2SURBVDjLY/j//z8DJZgsTUdmCkodmSV7eO8EkQayNN8+WPry3YOV/3d2ib0nVbMsUPPrT8/3/n9+Nun/1hbxP6Rolr99sOTtZ6DmD7cLwZrXVUt5kKb5xb7/P17U/b+4xu4/UHMRUYEI1KwK1PwOpvnSOgeQ5vlExQJQs8atA8UfPr+EaL662QWk+diSPDlWnAZsWjufedOaORyHZ0lrgzR/ebkfrPnWbm+Q5odAzYJY0wFQI+OmtXN5N62ZVbJpzYzrB2bIfX5zaxJY86NjYSDN34CaVbEmpN4lK5hWrJonBtS8ddOaeT82rZn9b8vSmn87u6X+393n///gdKP/QM3OOFNi95Jlks0Ll6+bOG/l//OXzv7/8+ny/09PD/zfPD/vHtTmVJxJuXfxErbW+UuyG6Yu+T9t15X/rQt2/k/t2vK/ctKa/0Utk7YuyFeXxpsX6qcvXdswe/3/tpXH/neuv/a/cu7J/9E9V//7Fi57n1w+QY1gZsppnfMvqWb6/8iSyf8Dcyb8907r+R+QO2tbbNHEIKJz46bF5SybFhVZbVqY17BpfqbEpnmpfJvmJfESYwAA/ZPGvT+K5AYAAAAASUVORK5CYII=', 82.0437, 3),
('Lynea', 'Muckeen', '2018-05-20', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJrSURBVDjLnZPda1JxGMcVxiCiPyD6B7op2FUE3UR0EQRddBHBGDNsvbKE1CWJtpqewbSNdMUg2IjtQieNE5XuOC98Yb6wC/EVNAVfEBkMN+fxXZ9+z4+OSXUR+8HDj3N4vt/v53k4RwQAopOWx+O5diKh3+8fdblcapZly/9sSCQSZ2KxmD4cDu8Fg0GWJF0ZSh2zk2Oz2fi1tbW/xfF4/BQR7xUKBTg+PoZyuQyhUAgcDse20+lcIqnZVCoFPp8PjEbjxp/Jo9FodDeXywGefr8Pwkkmk2C1WnlCACaT6YBhmGm1Wn1aEIpJw1QkEilks1nodDrQ6/WoAdbh4SHwPA+lUgnMZjPo9fpxpVI5ilpEFpP6nM/nKTIKEBub2+02IE06nYZarUZNOY4DnU6nEKhFZFGvBGQBGwkymQwQMigWi9BoNGihIc6v1WrtA4NAIOBDRAEXU7rdLtTrdTo3LhPxkQ6NSSCoVCrXwMDtdu+3Wq2BEFOazSZNRGMU4G0P2uD5hwmYensL7s5d5W+8uKimBt6trX1MQ3dBKCQeHR1Rw0/f3sPspgS+xpYhXOJg0fkY7ixegEtPzhpEoZUVD+4A04eFmCrMPMFc77HRJWAT7+ieDDv3YXHnARo0ROkZ5Sq/sABtr5cKqtUqLRwLjdbX1+HmyzH4HvsIw+dLZBkNQJSTSkd+PJverb95TZeGyZVKBcg3ARaLBRQKxezlp+caC9w9YLhJKma2J38T4CKyEslI9NHDVXZmxrOhkB9oNJoS2fSmXC4fl8lkYtI4d9twHoyclCbjjc90B//7B5LmeVJVxP51z+P7nwtGFih8vipxAAAAAElFTkSuQmCC', 91.8774, 4),
('Minnaminnie', 'Ridel', '1992-10-16', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAEUSURBVCjPXdFNSsMAEIbh0Su4teAdIgEvJB5C14K4UexCEFQEKfivtKIIIlYQdKPiDUTRKtb0x6ZJ+volraEJ3+zmycwkMczGzTE3lwkbxeLE5XTqQfTIjhIm6bCy9E/icoOoyR4v7PLDN+8ibxQHxGzE3JBfHrgUalDnQ6BNk1WRFPjs66kDNTxqg0Uh5qYg4IkrjrS9pTWfmvKaBaGaNU4EY+Lpkq88eKZKmTAhbd3i5UFZg0+TzV1d1FZy4FCpJCAQ8DUnA86ZpciiXjbQhK7aObDOGnNsUkra/WRAiQXdvSwWpBkGvQpnbHHMRvqRlCgBqkm/dd2745YbtofafsOcPiiMTc1fzNzHma4O/XLHCtgfTLBbxm6KrMIAAAAASUVORK5CYII=', 62.5322, 2),
('Simonette', 'Blaymires', '1988-01-06', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAANDSURBVDjLZZNvUBN0GMf3ot7ldb2q63UvuuuFd93Vq/ROMYyu9C4CCwE1uqHFOD3D1SxPUFCb5OBwBwMJMf5GjT/bMBhjILjGNraxv47JcGrIakIYAxT89BtXHdqLz7vn832eF99HAkg2UjhyYIugXRAR/CVYFswKumXD+995en6j+Izgh6TQf6sJe6wP0/QoutAonYEBOgLNHDLlPJL2ZRk+Mex57okAIT0rGGkMnufeooNQ3IsnPo424kQ/5afR6+Wya5x21wgV1jPkaNPdH7fvfn5jQFND4AxTC2b8CxZ8cz6csy6aJ338OBVG5ZhE+WuA74asaH0DVFgUpF9517AeIOS3BA+jD8zo5vR0zOvpjQ/Re9tLXfAGFz0hZHoHsh4Lp216NJEqHDNa3q9NXU1Tb9+dDPhJP1WN/Xc9LXNdtN23Yo25KXf6UNpuINU5yDcaOeLXoHYeJNj0EZNdpbgupVJS+YYnGRCd+KOHxmgt5bFLYrsXS8xF4S9OpF12iqw28iePUeLYxYxJzvyEDh7cZW6iA+P5nWvJgMXwvIlTwWJkk3I0dwdpidjJaR2jYGAYZegqSruCmO8EK7e7mTErSXh+ZnV6hPH6T5HIru1P3Jwz8Y37KAVuFfXTRnJbLOR2ekivuc6F/mri3q9ZS4yQuFlAfExG4EoeEw15vFf85rLks8HcO87ZTlTeU3wbHqTEdo3MRjvZ2hAntc3c93zF2pKFxfA+lqJ7WfAr8GtSMI+peF2x+Z5EFKNbG6hEN9XA4eunOelqJbtpFHltJTM2+T9yLku3svjTexy/+m2+139Onak4GTAoOaDLTBXFeOSJ6fnCeIgjA4WUNp3Fc7VInD3MUiSP5WgO8+KSgJCLLmZiDjcn5ceCrPUi7Wnd1VVuPkZPoAZlfQY+gwJ3r4o71gwWI3uJu77Epd6BXJ1BzVAxx9vy17f/18QPLqdtEsVwl/Uepv1cCixME9R8iEnxMqPVafSVbafBfBRjqAFFqzQphwQvPfFMO6u2bUq5sMVQIn2NFUsVK9YKrKXbaDv4Ct3D1WjMJ5LianKz4MX/feO/ZGx94WHZvlcf959No+7c1rUdis0JIfwmGBBkPz3/Nw6S0St8tXZAAAAAAElFTkSuQmCC', 80.3401, 4),
('Burch', 'Airs', '1990-07-12', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJsSURBVDjLfZO9a5RBEIefvfcuucRUanGiJkYjiNoEET9II0gUsRC0sbASO1G0MVhIiCL+BdoJYmOnjYWJQsA0QRBRYkBUJESJ+dJLzvfe3Z3dsXiTS6LowDKzC7+H3ww7RlUBCJcuKrv3IkNDqAgaAtF74lIuHT+OPh9m3YtnhlVRXC5Wi3SVMIrkdxHUef6MFYAXVIRoLVEkB4k06uI/AIUGwHnUWujoIFhLtJZgLSHLMF1dxLSOOvcfB84PmLnxG837a7QcaoJisvRukDTDvRojOD/wT0DTyYlJpFDze8612aZ2QiigkmEkpVSfoFx4VDOHw+SfAKOq6MODB8A8cd3XK9Y1E9OfSPYL9RkqDkxCc9nQ+uHeFF5PlS6Pja6dQZA+2XW+YqWFkFYJLheqd8QsRaqzpPNVsvbTlbgY+v4aokbp8eu2E+uLuVAciCd6i4oj+jqyMEddWsGGnr9nEHV91AT1GVEcGjxRcnFwea5+GqP6Ypxsempj6C1OAHd7B+XO0hA1/0TiG9YbJziqn8eJUmPfuSs0d+6h/nZw6/uXQ7eGjpZ+LbWg88bXIIa11sWi3jEzNsrOI2cofxrGPDhL6+fHbOvYkKjRK7mD4EeK1fFTrriZGNwa6yqOWKtRrnTCiasrvfdvIolmW+6gHu8UX9+fKpmUQqkMMaIh3wlUMW2tpG+eQv8m7DXDj2uGhe8zhES/meVtdDe7LiAMuO7TlaxpM0EialPwKdV3wyzMTrNlg1AsTLI4I3z5ngSf6Y0GACDr23Eg1qQPH3uimvUEUDXzURj5KHybm/16IgmmIyT6VeHesUG5/Rt5eNFI8xvNdAAAAABJRU5ErkJggg==', 66.7153, 1),
('Nate', 'Gilgryst', '2014-02-24', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKpSURBVDjLpZPNa5xVFIef+877Tmcyk2Q+M0onSVOKnVQRMaBWNwq6c6NQ0IV/gLjspuBGkEKh2JUb14J24UZol5EKRaqhtjiNCamtDcSkNpkknUzn/bj3nOsibbF02bM5cBbP+R0ejvHe8ywVfnj6YqXdKP88NpJv4w14RbxHrCVNLdZasiQlTVNcnCJJTBYn7G7urK8u3X43nJ4Y7R5/cbI906oBoA8TiXpU/T5MFFGPiCDqsSL8fv3P2qW0vxQerJfazZEcK6t3cSJc7d7hjbkOC9dWeOWlKZxVrt24w+zsIS5f7jJ5aAIR5YX2OM3nnq+GxuxvjXKG7YEydIahRGwPLT9duYmIoj4go0hq8vS2+ky3qzhVjDGYL779xQcuJlCPCXIcf/UoO1keUX14BjhRnCpj4ZD5+QXSQQ+XWTb/6RP+urj6Safpz9THS7lms93K5Ytm/eYS63d7ZE5wThBRrMB777zGkWOH9dbiXndjr69/Lf12zjzS+Nm5C9+9/vLMx53D04yXRzg6ETyh65sLf1AYKbK59S9XF7oXvz/76fsAAcCJL3+cqlfKH7SadTKB8oGnfTcqoyyv9qhW6kTlxpuP5sHbJ8+beHv3h85Mq4AJwQSMFcxTgFZtlJ37A8JCiamDY9W5t059DhBc+uoj35mdmatWqmzsWkSVYvQkwHtPqRiRxDG9PaFYnWK0VjkBEAIkmQYbW7vc2nhAkjaYv7JInGQ4UVIrWGtJk5QsSVlZXqEUKUHQDx8DnLVYUTLnWL69hqjHOUVlv4sYCPIE+Rz9BxnjtYgwnz/yvwQZcZwx2TiAuBD1HhXFOYf3EU4EFY/3iqgyHMS4LOMx4O/rN5aH9zY7UaGEikNVUSt4l6HOgxfEOvCKqpIMBtxbW/sawDzrO/8H1LyIqK9H3tEAAAAASUVORK5CYII=', 75.0703, 2),
('Sherill', 'Renol', '1986-06-12', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKGSURBVDjLpVNLaBNBGP5mdpNsHptH25i+0toIRRAFD3rxqCjowaPtzYNYvIleehE8iHgTBO1BBCl4aG+CxZIeWqrFBxVEUXpIwZqmsWuyaZNusu9xdlPxcSp04GP/Heb75pv/QRhj2M+i2OcSbz1+Ny9F5OOVhhXd0W3qckMuGBweuNydw+G67f9dMBDHsprbleJKoSCmU4ns2MXhuGExIoWEf9TJ/zFpf1uGLbQMp3f0nqFTpW7nTNslz+bLKFZMaAbDWtVFUXWxvuWivO1CaTBUNAbLAdarJh68KKOmGVROZw9RzXBIKEDR1xNH/oOCrR0LmThBgJsJCgRB0QOQDBNU6yamX28i2RFHZzLke6JN3fYt5rpj6M/EMbusoNaw0BWjPjHIhRISgdrwyAq6OuPI9cVAdotHNd1pZ5MfzPXGkE5FMLVQ9AkeUeao8nhyrohEIuKfCYt/lVFrtR0Qnh3bsiGJLgb6kph5r2C9ovt4/lZBlu/JQQeU2b6z35kVm4YDz41p2thUG8hmZASDAZRVCa9W6n6jDGdTSHx8Cm3uIcxSAXpnL8oXrgLsjCdgM15bolQ5OS0jLAXgKQ4diGCAwyublp8APk/h5KUrCA0dQetTHl+XpnGU1ZioqaVvhmkPHu4Pk1iYEkId/1bvSYS0O2H55X2cGL0GaXUBWLyDSCKJg9lBHFuYdERz5+fa6euzqZAcjYohgYg8m5SXT+AqlBJQ/t6bG2ui1D0EnL/xp4Vv9yCp10Syl2HKnxWLp0Yu90e/z8Bo/UCT7zXqAlZWUdrTMEU6Mk++vFm0y3oYdSGAmkpQKBGHX/2I7HWcl0YGxjV1Y0xwyKAjsBJnTZzL23d/AbqhIfYa8w35AAAAAElFTkSuQmCC', 63.6121, 2),
('Ronnie', 'Twyning', '2019-03-22', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALNSURBVDjLbZJtSFNxFIdvzKSBIfWlKCqMygiMoj5UhItR9CKaHxSNIqhMtIhsZSsrtbISZTE0nbP0w2Yh03xhmK2WKd3EmGV+KIJKiCTIoBesmXXd07mIlS8XDhf+/J/fec65VwGUcdVRGS1lo83RTUeZht+u4SvupvWSjYbc6In3J8IWAYM8qYXeZikvPG+Cx25oL4P67CCeLMvkgI7KcNqdrXTVwLN6ueyAO4VIV2g6Bw1WaM6FtqvQmAPXd7fiSA7/F9DmsPNEYD3AV6wJaBZd499ONw8bcR00U71Xo17C3Jlg32EbDWgri+FhiUbXLel4RaMpfxGNZyJEt0B0O6nJ7MS1v4CKXRE4kxZRGq/hkSmKTBqFG1Yo3LfZUatFz67rmmm0zqfO0kfLRajNgluH5H0MKhL7KNk+n2KzWULgxh4oWG1TRPcVnTWjs9WfMIpuHd7ziK6HylQT1xJNouvBnS5dY+soWm/kwhrEDHKiXyiiO0ynbNmTpR8aRDeIOwPRNQUCgQRVVVeIronSOLi4Nkj+SgNnlsPNIxKw+KsiusOoVbKYg/p2jVSk6LoD1B7dKPBvv9//i/KkbaL7jrwYsC41krNkdLSzUYOKbPc1t7MR3aDohoturL5dgd0898Gbe3g8HpeauvBUR0LkB785LNQeF671ZSzQA2SEil1HRTddFhM59tkEni2dB71eb0jgkPfcvm+9x9cND7XYCL28y49aC4HDMSM9yTOrlUm/spTA5QJrfOqBjwFads4hKDAlsn3rLLgcxaeiTfg2G/qmglcJPKJ3drlcqtPpVP3m6YSeNvD/8yVvLvo4kwIE9gs8JPCNsbOWHTN/fK86AAL9PKnwWepdhgHfFkP/RDhO4H6Bz/5//ihlXn5X2rKRD9YoBk5P523aNB7Eh2l3txhyxgUIXClwwlR7UVMWnLqzdcZHXVs6v9dh/fwPHS3E3E4GyQ4AAAAASUVORK5CYII=', 63.5098, 3),
('Paula', 'Lerwill', '2009-09-06', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKgSURBVDjLlZLrS1NxGMd90ZvovdEfEBEUEhZIb0xMjdyLIuyGkiHGUFKydFKKJiRegjIyFJRwojMxzfJSaVOYeTfxtpSNuZ1tXnY2z27nsss5334uWloG9uLD7/A7z/fzPPx4IgBE7ISl3qWyelUvu9JIueZqeOdUmcCMFDgcQ3fntjSK0j/rwx+csesIZ3jbL1j6EbCPIej5DpE3QRIoBJ3LEFb74BjIxkbXVYNdrTixS8Ca3h/y6pSTfloD0UcRjCS8BJGbRdA7QRgjd1pIfhruyeewKOMdm+rCw2GBV1tXKZh7SIEVoqAjpwVS0AlIvhBSkCGyeQRcPYDogO1DNixvrveFBa6ZCkuAmSe1OtJpFVLATkJboWCIAE3+GYngI6ENgnUK+hcxfFiw9fWRT+RWEWTHEeRmyPhaMvYCgu5ZEpgkbzCCgPszBNsr8NY8iF4Ky5WnpLDArs41+zYnSPdF8OYi0qEcTHc6mF45mJ4M2Ftl4C1lYPU34KerwFNTWKmO/j2BfbiwghmvJuPawZsUsNVHgTPlEx6ANcjJeR9r5QfhWUqEJOlhbc+FoV42FBY4R0sPbPbKlz2LLeQB9aCbYkJhzpIFlkoDZ8zDRk0kRHYYrm8d0JYeEyyduUd37QH9pTBqvSOV9iy0wtmZ+VNAOm+HOeM92JtlYDQN0JYcD1BtmTf/WqRtbJ/yTxtUt9fXGhPBq5MhriVBtMYhoLkMQ1Ek5sqi3eb2O4l7buIvhlRPkmsfZ/ibax+iruosnpacQUFOOq7Fn5TUypJz/1zlnRQr5JSypRVKZRvq6htR/ewlriTH03vV7ilQ5NwaHRgchM1GY3p6Bq+bmpEii9XtWzCgqkhLuXSBTUg4L8XFxUoXk2K57obirH0L/ocfNQ8V8wE+uE0AAAAASUVORK5CYII=', 94.0642, 1),
('Bevan', 'Smallpeice', '1997-01-01', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALDSURBVDjLpZNLTBNRFIb/6RMqtEDBFopFXiFGIERYmKgJUXBFQly4gI1LXbghcYPiI/JYmbhxLQvC3hjjQkSL4SnvYCRUCNJCSwSq0OnMdObeud6ZBIzB6MJJTiZz7/m/c89/5gqMMfzPY/tXwkYkUmkRhOuU0nJCyKvs7OyXPp+PHu4LfzvBSjh83+PxPM5wOs1vSZKQTCbjsizX1NXV7ZmLBuBPMbOw0LsVjzNVVZmiKIwLGQewRCLB5ufnv49NTGQYeZY/VQ6Nj/d5vd67BV4vOAC8IjjEqA673Y4stzuHi28buccAoVCoJ+D3dwZ8PqTTaRPAewf3wHwfHBwgx+OBRkjnMcDq4GB3FaX3TrvdZkVDfCg0QtM0c52birSm5f0G2O7q6vY7HF0FNhtofz/02VlTbIgM8ZORdvS+v4bME04kRRGpVCp8BFhtb7+ZUVralcF7JpOTIJEIhIEBYGjoV2Wiojj/DDpeNOHT8hJSothkjnEsGHT6W1qUYGsrtOlpkFgMOh/Xw+Y1MKpCZRQqhxTlVaK2+CI+fn2Hxc0pppC0+8OdhGhLWq0lRQ4HGDeHRKPQueOUB9FVNFffAGU6qE6hgyG2H0VN8QWIqizMRkb2a3ssebYfsqzK8Tj0RAKU93YIMI5siDf2vkDTuYm6Bo1qOEgnUXfqEkRNskytj+5ZdkRxI7y4uJRcXmb2wkLQVMoMhSgglMDnDsLvLkGhpwx2ayYKsgOYi45hbG10R1LRYP7Kz3Jz8+srKuYqq6r8mYzZpc1N3GqLQuFjVHkrMlFZef5Z4XzZVcxExjEcfrOtElyJ9bHPR3fhaVZW7kmX6/m5QKDRIwhuhRsZkyQ9Kkmtbbu7r6t7LKmG4GVXKDy8peqmeOXYZXrkcAgeq7U+02JppIytqbr+tkNRksZe2QMhRXWrS9Zp2bc+tn6o+QkxLL87j8znVAAAAABJRU5ErkJggg==', 98.1661, 4),
('Zebulon', 'Lenoir', '2008-03-14', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAEwSURBVDjLpZMxSkNBFEXPD2IhVmKlS8gGXIBdsHQRkt5dWGYfFmYXtsHaQkTQRlDIzHv3WsyPIfiDSh4MU8zlzJ375nW22aX2fhPc3D1v3JA21xcn3Z8BAKdH+9hgm8fXMuzg9v7TBpRgwIbLs4MOQDYSWCarhgEpOD4cIcCCl/cmzDRKkEzKlNgCsCHddhlWugiRaVIiE+oyhwGRNJs9IHtdTTeITOZPByOA6XRq9Q5C6zWZTFyLqSFqiAhRqhiPx94AzGazbuWgLaMU8/m8KyWJFFlFDVOLWCwWP9sYakHKbhn0Tyghovr7CXVbiJki1a0z6E3WZbMvNU0t3hKi4ektyb4jqx9eQkQay62V3gK4Oj/shn5hrUmGkVcQ/W8WIszD4weyBs+7XadxxI71BUieEw+8ru7iAAAAAElFTkSuQmCC', 68.2567, 1),
('Stillman', 'Quigley', '1989-05-31', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAF1SURBVBgZpcE9axRRFIDh99y5s1nHjawQVEgQGxErIWgES9MGBDuxlrBVfkG6lBEsrUQEEXu7gNgIUSTBQrBSyYdgFjXMktmdmTvniLCB28/ziJnRhqMlR0ueyNrTLzY7A0UVON/r8PNojDjoZQlqwt98zNvdw9vfX97/yJQnMi4m3F26xr3FHm+2D1h/eJ3Yi3dDVOUDIEw5IkVZ82cU+G/r0y9OTQLkJQyPK0SUmCfinJAY1I3yeLCIqmFAgpF5KMuS/KQi5ol0U8ekrNl4/QMnEBpFG8UAMwODLFVinkhQo2wCiUsBQ2gQEUwNMyWEmqoKxDyRUVGTimewMkvQCnBgYKJ0fYfNV3v8zk+IeSKNGgkpyphnO6vMZZcRHMNin0e3nuDoUpQVMU/E+4Qrl+Bib8TyjSX6nXlwcDyZ58LZQNYBL0JMzIxTNwdb768unLnTn+nT9ecIWiOqiDWoFHzd+8ZRXvP5+QNhSsyMNhwtOVr6B/fLolbgemG4AAAAAElFTkSuQmCC', 50.4016, 1),
('Amelia', 'Freda', '2007-07-28', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAJUSURBVDjLhZPPS1RRHMU/997nzDihTx0zFxrRxkqyQKNaBBGCWzetXUhYCUKLfrhtEdFGCqEWQf9AuK5FQouiokWrFoYuBioZ480o47x57/5q0cw4ReUXzvKce8/3fI/w3gMghBgCDgGK/08JKHrvHQDeexoi4/V6vaK1tsYY/zfU63W/vLz8EDgCSO894sKtF2Z4IKcS5XHG4qzHGEdeKDaKEasPpnDOkaYphUKBra0tVlZWHs3Pzy8BxSCXzzJ+cpC1qEaaGoy2OOMYKXSytl5CSon3HiEEAGEYMjMzsxAEAXNzc0vSGmsq2zFHuzpIYk1SN4z0dVKuxOAsSimklC2BTCZDLpdjdnZ2ARiQ1pibqx++plE55nghz4n+PFF5l1dvNrhx+TRSSpRSZDIZKpUKURRRKpVaGxX23VD4fnPs+bGe4uQBVcVZTznO8M1PcerSXVBdWGt/g3OOMAwJguBs4CyLZ0bHJkXfHZxLkGabXr1N1+ZL4s/3yY/dQynVjBohRDM1AKTTtWuifxqrK9i4iN1dx8YbyL4Jdj4+aRGbVpRSBEHQEgis0d3Sg7dVsDW8reF1BYQiKe/seW28rJT64wfG4X2Kt/Evsqvh7S7YOjrZO7RmlO1kAGl0uuP1DjjdEInBW7yponV361pbBCmRUrYJVPXj+MszhOxAZg8ic4MI1cOPT2/Jj179bXntaFn7/pQwiVisRVx3KV06BeN6Cc9d4fD0bYJ8+K9SuSAIzou2Nk4kSfJaKZUD5D6NdNbaWjabvdguMNyo837k5lig9BMTlFjmy9KhMwAAAABJRU5ErkJggg==', 67.9374, 1),
('Nicki', 'Bontein', '1983-10-24', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAALTSURBVDjLpZN9LBRgHMf1R/NPuo7Uam0aaV7G2uSvYki6c4hhWZe3mJw6i9FxnMj7RUNeIzYvnUtLuXKGXDV2yMm9JK10iDHlvOTuvN6369Zs1kZbf3y2Z8/2+ezZ8zw/PQB6/8NfG1H2B1n5JMPlAsoBsEkEsFyISqqdccY/Ba7ZGTJKvYiaygBDVGi570tEtjsBMY77NRRbo7RdA2UUAmq0IlsrZVN+Q0SmhzHinQ1xxY6wuGsg23Ef2sqSMclno7cqBtFOxoh1PYLr500RcYa4Vpvgqb9joDLIZE498wmLPWWY6rgHMfc25C9zoZCLwIk0Wxxttr800hCAz88zMfTQDeIS66BtgSKqVbei/xFmB5qgGuJoadStFSIO+BkWX6e7GFiQvAB+TmFe8gTCPNLMlnyY0rDX/GxULYd+GisDVVDLmnWo3jdAwLbFd2nK5uq3Fky/vguV9Ck2xrohrYlQ62Rjd46+EamedozUCdnEMrhJXmhM8tTRnucChYyFTVU3VKM3MNdPx8e6MEgqA3/0F/mc1DMic/cYuHFDTDy6MTypQv0kECsDaH1AVocACmkiNtVCKL8EQz1BxdIwE/IKpxlRvusp3SVa+1Z7u/qx0dS7gXIxQBdqECnQIJXzDNPvGH/kIKjHL2NRlgRZoRtiIyJTt15hMNliY5aXgOJqHkL4QFgrwKrjQdp2S3vst1DLw7AyEYgF7UlGSi5gtiUewjjLta2AmGWpUbTfQUBEDTI6lIgr4uBDKxNifgEm+/yhlFMxN5QASakPAsNLMd+Zjn6GlWYrIK2lJ4oSzddDQ7PW7UMEeJx7Dlgaw8gDP3Qxj6KnnAx+DhkuflWghzOVgym2K1onfdtHkjfSDFKYGUbHvXnlaeE2WBUWY7WvEH2Zzqi/agYHcq7ixMWW9pvRqYfGuTSDHafR34Gozg62WH+VQ17vzHd5w2PYmO40zr8A5dG3M3vHNHcAAAAASUVORK5CYII=', 64.4586, 2),
('Lowe', 'Pochet', '1993-11-11', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKVSURBVBgZBcFPaNV1AADwz/f7+73XnNveK9+2x6RVqMVGoaYjg6DsEtGhhLpEtzrXECGCYIkdO4wulZcgunQKhFpkan92iXBoWrRmI4e4tf9ue2/v/6/PJ9TfVMwPm5AaBxARARABAC3cNdlYcDbND5tw6OS4wWMkOWJKCMRAiMRADEgICMja3P1tPP/tBanUuMFj1BPKYyRY/pPVGWIkiYgkCJEso6fEwJMMXBhPQZIjdnH0FOAUzQpzF7n1De0dBLIMgY0luvbRIeogpFQXufE189NUVsjtZfQVXvyYoROAQLNJrUmrQYNURAxUF7n5JTGQRkpHOPIGhWGeeoeZ89y6SL1Fo06zTY0oIqI8xqtf8Pw5Dr7M1jyX32XhZ+DoW1ZjYim/a6u+RbNFg1QHEgJye+kfoX+E0VNMf8jVT+l0bGwuCMNlpdHT1qc/Ym1JX40oImD9OlNvc/U8lRVy3TzzPj373bt8TmvrksJjx1VuT0mKI9ayqsXQI4qIkSyyu8zCFa68x+0fyXXz9Bm1NCg88ZJ2dU5XaUjaTfnZwyrHD0t1IJBknDhDroeFn5j5nNIIPYPS+8qaG/+KyaoQK/J9q9Sqdv5rSEHM6H+coTEga3FzSu3Xz2xmK0J/qtP6Q+xsEntlzYa/v5pTvDYnBQK7yzSr5LpZ+cd2/Z6tO7944ORrssb3QnvbX1MVuVZd0ti1Lzfsweo1qQayFtp8d5pcgYXrKr1dSs+9rrH6iTQtmL1U0T3fcWCwT2jvlRT6iCQfHFJU3nPC/YfI9xAz+gZUbdvzUC+tdbM/bOmtljz6yAGxKy+mOeZvsLk4GeovKObLJpSN66CFGneK+1UfPqi2tqP4+6zh7R1aaCBF3mTtrrP/Ayh5+MxrJCCJAAAAAElFTkSuQmCC', 57.001, 2),
('Dorie', 'Leadbetter', '2014-11-03', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAGJSURBVDjLY/j//z8DJZiB6gaUl5fXw9g5OTkOqamp++Pi4uaHhYUpwMRtbGwKjI2N52tpaQmgazYoKir6n5+fnwATi46Onh8cHHwfWZ2BgUGAurq6AoYLiouLE3Jzc+enp6fDNQQEBCh4enr+t7OzC4CJqaioJGD1AtTJCkAn/wc6OQDJyeuBTt4PYisqKipISkoaYBiQmZkZkJycLABiA52838vLaz+Skx20tbX/y8vLK4iLiydgDcSEhISAiIgIB6CTHdzd3ROcnZ3/m5mZOcDkZWRk7ouIiOzn4+PDNADoZAegkx2QJYBOvg8MZbgrhISEEri5ue9jRCMwlAWATi4AOjkAyckKwFCuBzq5HuhksMFcXFwCLCwsBTjTQciUB0KV655fIpRwoqc9uGqec0kTxQCgZt2uHa++zDr49v+E3a//9+549b9j26v/zZue/89b/PhZ2rxHz/IXPf6fMe/h/6Ilj/+71984rR5+WhPFBYET7gnlL3tK0AWeDTeuwTTTJi/Q3QAAViCHY9kyiUsAAAAASUVORK5CYII=', 98.6537, 3),
('Sibylla', 'McGonagle', '2006-05-08', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAADoSURBVBgZBcExblNBGAbA2ceegTRBuIKOgiihSZNTcC5LUHAihNJR0kGKCDcYJY6D3/77MdOinTvzAgCw8ysThIvn/VojIyMjIyPP+bS1sUQIV2s95pBDDvmbP/mdkft83tpYguZq5Jh/OeaYh+yzy8hTHvNlaxNNczm+la9OTlar1UdA/+C2A4trRCnD3jS8BB1obq2Gk6GU6QbQAS4BUaYSQAf4bhhKKTFdAzrAOwAxEUAH+KEM01SY3gM6wBsEAQB0gJ+maZoC3gI6iPYaAIBJsiRmHU0AALOeFC3aK2cWAACUXe7+AwO0lc9eTHYTAAAAAElFTkSuQmCC', 62.1903, 2),
('Rick', 'De Cruz', '2016-11-18', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAACtSURBVDjL7dIxCwFxHMbxX8mmDAa67tV4D7wDZTolMlzpn+QoouNlyMZ0Vyc5g1v/JQPdYlJGmb5egbpLNsOzfuqprwDyzeQPfABc08A1FdOSZlLQODlFL2OkARThGGIfLhsIujxtUcmBWVETe3AcQNCGaMG9KTo5MMprTkvYdsCzYD/kWk8D9LMK34ZoDqED6waHaooLL1uMR0vUzRJ9roneVUStymL8S/wR8AaM7e7IrixORwAAAABJRU5ErkJggg==', 95.5132, 4)
GO

--muebles
insert into dbo.Producto (nombre, descripcion, foto, precio) values
('Pate - Cognac', 'Producto de calidad', 'data:image/png;base64,iVBORw0Klzc3O7OJpjqa+ZsAAAAASUVORK5CYII=', 11.22),
('Ice Cream - Strawberry', 'Producto de calidad', 'data:image/png;base64,iVBORjkpVJK3QAAAABJRU5ErkJggg==', 14.55),
('Chicken - Whole Roasting', 'Producto de calidad', 'data:image/png;base64,iVBORw0EOghMJb3AYt3K2ufolkg==', 12.43),
('Tart - Pecan Butter Squares', 'Producto de calidad', 'data:image/png;base64,icfbw/9D+/b9+VANbcvjMB1QURDsL/45xE/8/JVAVr3NVtvRY5cIEKW4J7NP737koB2wyiQXx4GBCDgYo7gPgTyNlQugMkDgAAPd9LkvTMtAAAAABJRU5ErkJggg==', 7.84),
('Veal - Chops, Split, Frenched', 'Producto de calidad', 'data:image/png;base64,iVBORw0KGgoAAAANSUhERVh0h1S8hmy7bJ0G+i60ECg2QXaIqVaqwttplXCSEMNDlZTqdEaEkyVbhprMBhwkXkCsCqcdHcOzxE8vsD2fhVr74vwRlXjVkJggg==', 14.3),
('Schnappes Peppermint - Walker', 'Producto de calidad', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0oiLVHBMbGymS7aUhIdoPNBf7Jjw/gQ77u4AAAAASUVORK5CYII=', 10.49),
('Sobe - Green Tea', 'Producto de calidad', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAIhSURBVDjLjZPfS1NxGMbPjX9Bl/0PXqQzIYIE2yKVjlgiQ1jSZgzo+K1eTC+mWvTmbB3dLEGumu34HFDhkJggg==', 11.91),
('Puree - Blackcurrant', 'Producto de calidad', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdZudcAjgZOOeJ3jkHJ0zggNpfYEZnU63wHeoAAAAASUVORK5CYII=', 8.62),
('Cheese - Mix', 'Producto de calidad', 'data:image/png;base64,iVBORw0KGgoAAdhcmUAQWRvYmUgSW1hZ2VSZWFkeXHJZTwAAAKjSURBVDjLrZLdT1JhHMfd6q6L7voT3NrEuQq6aTneOvqhLnPCxdjmqM12kN7SwTl5eX7qqurq2pra5eampqSGo2II=', 13.06),
('Pie Filling - Apple', 'Producto de calidad', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAASW1hZ2VSZWFkeXHJZTwAAALcSURBVDjLjZJpSNNxHMb/VhTUi3piKthYOkJhYkz7lQdKYgqOw8rBKJFYLiraDTec1LjVOrSJ5CYII=', 13.75),
('Jicama', 'Producto de calidad', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQWRvYmUxUZpmvzDA29I3Bv7m5l7Dd8kw6XoJxL0wAAAABJRU5ErkJggg==', 7.87),
('Spice - Greek 1 Step', 'Producto de calidad', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAQAAAC1+jfqAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdMLfrtkV62d2cz8hmVcDPbqfy6NlFRFHkA7AAAAAElFTkSuQmCC', 11.45),
('Longos - Penne With Pesto', 'Producto de calidad', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0Q5VNpGri0jOjUW9DD1sXOIHS+RzcbUWykqFfNnP3jlFTkSuQmCC', 9.39),
('Berry Brulee', 'Producto de calidad', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U29mdHdhcmUAQzOnRjM1ifijfR2xOlM2jy1c+9X/OIlUgOn2F9dINwTdu7frc=', 14.74),
('Creme De Banane - Marie', 'Producto de calidad', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAAK/INwWK6QAAABl0RVh0U2mw4j9PgnmiT2LbP2ZePP8OiAqyZHfdgY0AAAAASUVORK5CYII=', 7.59)
GO
--EmpleadoXProducto
insert into dbo.ColaboradorProducto (idEmpleado, idProducto) values
(22, 1),(22, 8),(24, 11),(10, 1),(19, 7),(19, 4),(25, 11),(3, 1),(1, 15),(9, 8),(24, 9),(8, 5),(20, 11),(25, 2),(12, 7),(10, 12),(3, 1),(18, 12),(4, 12),(18, 6),(22, 10),(7, 11),(10, 10),(17, 2),(6, 5),(22, 14),(25, 4),(25, 9),(5, 4),(20, 2),(14, 12),(3, 14),(19, 6),(17, 10),(11, 5)
GO

--ProcustoXEnvio
insert into dbo.Envio (cantidad, precioProducto, idSucursal, fechaEnvio, idProducto) values
( 1, 51.88, 3, '2020-07-13',  9),(46, 53.63, 2, '2020-07-11',  8),(12, 47.35, 2, '2020-07-11', 15),(35, 59.40, 1, '2020-02-10',  7),
(49, 55.19, 3, '2020-07-13', 12),(42, 58.74, 3, '2020-07-13', 13),( 5, 49.21, 2, '2020-07-11',  9),( 4, 53.58, 2, '2020-07-11',  4),
( 7, 50.23, 3, '2020-07-13',  6),(40, 46.49, 1, '2020-02-10', 14),(11, 57.80, 2, '2020-07-11',  4),(20, 45.32, 1, '2020-02-10',  6),
( 8, 48.27, 1, '2020-02-10',  2),(48, 49.55, 3, '2020-07-13',  9),(41, 56.46, 3, '2020-07-13', 13),(17, 56.50, 3, '2020-07-13',  9),
(33, 47.89, 1, '2020-02-10',  5),(14, 45.82, 3, '2020-07-13', 14),(37, 57.96, 2, '2020-07-11',  1),(44, 49.44, 1, '2020-02-10',  7),
(13, 57.13, 1, '2020-02-10', 13),( 2, 58.58, 3, '2020-07-13',  1),(34, 47.94, 3, '2020-07-13',  4),(19, 56.90, 2, '2020-07-11',  8),
(11, 50.51, 1, '2020-02-10', 11),( 1, 46.51, 1, '2020-02-10',  8),(46, 52.07, 3, '2020-07-13',  4),(46, 50.83, 3, '2020-07-13',  3),
(10, 47.24, 1, '2020-02-10',  1),( 9, 51.79, 3, '2020-07-13',  9)
GO
