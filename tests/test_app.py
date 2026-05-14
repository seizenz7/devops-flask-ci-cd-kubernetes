import pytest
from app import app
@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home(client):
    """Test untuk route utama"""
    response = client.get('/')
    assert response.status_code == 200
    assert b"Selamat datang di Flask DevOps Project 1" in response.data

def test_health(client):
    """Test untuk health check endpoint"""
    response = client.get('/health')
    assert response.status_code == 200
    assert b"healthy" in response.data