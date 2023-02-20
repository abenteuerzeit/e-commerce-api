import request from 'supertest';
import app from '../src/index';

describe('GET /api', () => {
    describe('when the user is not authenticated', () => {
        it('should return 403', (done) => {
            request(app)
                .get('/api')
                .expect(403, done);
        });
    });
    describe('when the user is authenticated', () => {
        it('should return 200', (done) => {
            request(app)
                .post('/api/login')
                .send({ username: 'admin', password: 'admin' })
                .end((err, res) => {
                    request(app)
                        .get('/api')
                        .set('Cookie', res.headers['set-cookie'])
                        .expect(200, done);
                });
        });
    });
});

describe('POST /api/login', () => {
    describe('when the user is not authenticated', () => {
        it('should return 403', (done) => {
            request(app)
                .post('/api/login')
                .send({ username: 'admin', password: 'wrong' })
                .expect(403, done);
        });
    });
    describe('when the user is authenticated', () => {
        it('should return 200', (done) => {
            request(app)
                .post('/api/login')
                .send({ username: 'admin', password: 'admin' })
                .expect(200, done);
        });
    });
});

describe('POST /api/logout', () => {
    describe('when the user is not authenticated', () => {
        it('should return 403', (done) => {
            request(app)
                .post('/api/logout')
                .expect(403, done);
        });
    });
    describe('when the user is authenticated', () => {
        it('should return 200', (done) => {
            request(app)
                .post('/api/login')
                .send({ username: 'admin', password: 'admin' })
                .end((err, res) => {
                    request(app)
                        .post('/api/logout')
                        .set('Cookie', res.headers['set-cookie'])
                        .expect(200, done);
                });
        });
    });
});
describe('GET /', () => {
    it('should return 200', (done) => {
        request(app)
            .get('/')
            .expect(200, done);
    });
});

