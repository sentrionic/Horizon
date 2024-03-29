// Code generated by ent, DO NOT EDIT.

package ent

import (
	"context"
	"database/sql/driver"
	"fmt"
	"math"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent/like"
	"github.com/sentrionic/horizon/ent/playlistsong"
	"github.com/sentrionic/horizon/ent/predicate"
	"github.com/sentrionic/horizon/ent/song"
	"github.com/sentrionic/horizon/ent/user"
)

// SongQuery is the builder for querying Song entities.
type SongQuery struct {
	config
	limit         *int
	offset        *int
	unique        *bool
	order         []OrderFunc
	fields        []string
	predicates    []predicate.Song
	withUser      *UserQuery
	withLikedBy   *LikeQuery
	withPlaylists *PlaylistSongQuery
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the SongQuery builder.
func (sq *SongQuery) Where(ps ...predicate.Song) *SongQuery {
	sq.predicates = append(sq.predicates, ps...)
	return sq
}

// Limit adds a limit step to the query.
func (sq *SongQuery) Limit(limit int) *SongQuery {
	sq.limit = &limit
	return sq
}

// Offset adds an offset step to the query.
func (sq *SongQuery) Offset(offset int) *SongQuery {
	sq.offset = &offset
	return sq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (sq *SongQuery) Unique(unique bool) *SongQuery {
	sq.unique = &unique
	return sq
}

// Order adds an order step to the query.
func (sq *SongQuery) Order(o ...OrderFunc) *SongQuery {
	sq.order = append(sq.order, o...)
	return sq
}

// QueryUser chains the current query on the "user" edge.
func (sq *SongQuery) QueryUser() *UserQuery {
	query := &UserQuery{config: sq.config}
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := sq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := sq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(song.Table, song.FieldID, selector),
			sqlgraph.To(user.Table, user.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, true, song.UserTable, song.UserColumn),
		)
		fromU = sqlgraph.SetNeighbors(sq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryLikedBy chains the current query on the "liked_by" edge.
func (sq *SongQuery) QueryLikedBy() *LikeQuery {
	query := &LikeQuery{config: sq.config}
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := sq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := sq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(song.Table, song.FieldID, selector),
			sqlgraph.To(like.Table, like.FieldID),
			sqlgraph.Edge(sqlgraph.O2M, false, song.LikedByTable, song.LikedByColumn),
		)
		fromU = sqlgraph.SetNeighbors(sq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QueryPlaylists chains the current query on the "playlists" edge.
func (sq *SongQuery) QueryPlaylists() *PlaylistSongQuery {
	query := &PlaylistSongQuery{config: sq.config}
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := sq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := sq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(song.Table, song.FieldID, selector),
			sqlgraph.To(playlistsong.Table, playlistsong.FieldID),
			sqlgraph.Edge(sqlgraph.O2M, false, song.PlaylistsTable, song.PlaylistsColumn),
		)
		fromU = sqlgraph.SetNeighbors(sq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first Song entity from the query.
// Returns a *NotFoundError when no Song was found.
func (sq *SongQuery) First(ctx context.Context) (*Song, error) {
	nodes, err := sq.Limit(1).All(ctx)
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{song.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (sq *SongQuery) FirstX(ctx context.Context) *Song {
	node, err := sq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first Song ID from the query.
// Returns a *NotFoundError when no Song ID was found.
func (sq *SongQuery) FirstID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = sq.Limit(1).IDs(ctx); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{song.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (sq *SongQuery) FirstIDX(ctx context.Context) uuid.UUID {
	id, err := sq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single Song entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one Song entity is found.
// Returns a *NotFoundError when no Song entities are found.
func (sq *SongQuery) Only(ctx context.Context) (*Song, error) {
	nodes, err := sq.Limit(2).All(ctx)
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{song.Label}
	default:
		return nil, &NotSingularError{song.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (sq *SongQuery) OnlyX(ctx context.Context) *Song {
	node, err := sq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only Song ID in the query.
// Returns a *NotSingularError when more than one Song ID is found.
// Returns a *NotFoundError when no entities are found.
func (sq *SongQuery) OnlyID(ctx context.Context) (id uuid.UUID, err error) {
	var ids []uuid.UUID
	if ids, err = sq.Limit(2).IDs(ctx); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{song.Label}
	default:
		err = &NotSingularError{song.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (sq *SongQuery) OnlyIDX(ctx context.Context) uuid.UUID {
	id, err := sq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of Songs.
func (sq *SongQuery) All(ctx context.Context) ([]*Song, error) {
	if err := sq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	return sq.sqlAll(ctx)
}

// AllX is like All, but panics if an error occurs.
func (sq *SongQuery) AllX(ctx context.Context) []*Song {
	nodes, err := sq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of Song IDs.
func (sq *SongQuery) IDs(ctx context.Context) ([]uuid.UUID, error) {
	var ids []uuid.UUID
	if err := sq.Select(song.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (sq *SongQuery) IDsX(ctx context.Context) []uuid.UUID {
	ids, err := sq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (sq *SongQuery) Count(ctx context.Context) (int, error) {
	if err := sq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return sq.sqlCount(ctx)
}

// CountX is like Count, but panics if an error occurs.
func (sq *SongQuery) CountX(ctx context.Context) int {
	count, err := sq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (sq *SongQuery) Exist(ctx context.Context) (bool, error) {
	if err := sq.prepareQuery(ctx); err != nil {
		return false, err
	}
	return sq.sqlExist(ctx)
}

// ExistX is like Exist, but panics if an error occurs.
func (sq *SongQuery) ExistX(ctx context.Context) bool {
	exist, err := sq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the SongQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (sq *SongQuery) Clone() *SongQuery {
	if sq == nil {
		return nil
	}
	return &SongQuery{
		config:        sq.config,
		limit:         sq.limit,
		offset:        sq.offset,
		order:         append([]OrderFunc{}, sq.order...),
		predicates:    append([]predicate.Song{}, sq.predicates...),
		withUser:      sq.withUser.Clone(),
		withLikedBy:   sq.withLikedBy.Clone(),
		withPlaylists: sq.withPlaylists.Clone(),
		// clone intermediate query.
		sql:    sq.sql.Clone(),
		path:   sq.path,
		unique: sq.unique,
	}
}

// WithUser tells the query-builder to eager-load the nodes that are connected to
// the "user" edge. The optional arguments are used to configure the query builder of the edge.
func (sq *SongQuery) WithUser(opts ...func(*UserQuery)) *SongQuery {
	query := &UserQuery{config: sq.config}
	for _, opt := range opts {
		opt(query)
	}
	sq.withUser = query
	return sq
}

// WithLikedBy tells the query-builder to eager-load the nodes that are connected to
// the "liked_by" edge. The optional arguments are used to configure the query builder of the edge.
func (sq *SongQuery) WithLikedBy(opts ...func(*LikeQuery)) *SongQuery {
	query := &LikeQuery{config: sq.config}
	for _, opt := range opts {
		opt(query)
	}
	sq.withLikedBy = query
	return sq
}

// WithPlaylists tells the query-builder to eager-load the nodes that are connected to
// the "playlists" edge. The optional arguments are used to configure the query builder of the edge.
func (sq *SongQuery) WithPlaylists(opts ...func(*PlaylistSongQuery)) *SongQuery {
	query := &PlaylistSongQuery{config: sq.config}
	for _, opt := range opts {
		opt(query)
	}
	sq.withPlaylists = query
	return sq
}

// GroupBy is used to group vertices by one or more fields/columns.
// It is often used with aggregate functions, like: count, max, mean, min, sum.
//
// Example:
//
//	var v []struct {
//		CreatedAt time.Time `json:"created_at,omitempty"`
//		Count int `json:"count,omitempty"`
//	}
//
//	client.Song.Query().
//		GroupBy(song.FieldCreatedAt).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
func (sq *SongQuery) GroupBy(field string, fields ...string) *SongGroupBy {
	grbuild := &SongGroupBy{config: sq.config}
	grbuild.fields = append([]string{field}, fields...)
	grbuild.path = func(ctx context.Context) (prev *sql.Selector, err error) {
		if err := sq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		return sq.sqlQuery(ctx), nil
	}
	grbuild.label = song.Label
	grbuild.flds, grbuild.scan = &grbuild.fields, grbuild.Scan
	return grbuild
}

// Select allows the selection one or more fields/columns for the given query,
// instead of selecting all fields in the entity.
//
// Example:
//
//	var v []struct {
//		CreatedAt time.Time `json:"created_at,omitempty"`
//	}
//
//	client.Song.Query().
//		Select(song.FieldCreatedAt).
//		Scan(ctx, &v)
func (sq *SongQuery) Select(fields ...string) *SongSelect {
	sq.fields = append(sq.fields, fields...)
	selbuild := &SongSelect{SongQuery: sq}
	selbuild.label = song.Label
	selbuild.flds, selbuild.scan = &sq.fields, selbuild.Scan
	return selbuild
}

func (sq *SongQuery) prepareQuery(ctx context.Context) error {
	for _, f := range sq.fields {
		if !song.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if sq.path != nil {
		prev, err := sq.path(ctx)
		if err != nil {
			return err
		}
		sq.sql = prev
	}
	return nil
}

func (sq *SongQuery) sqlAll(ctx context.Context, hooks ...queryHook) ([]*Song, error) {
	var (
		nodes       = []*Song{}
		_spec       = sq.querySpec()
		loadedTypes = [3]bool{
			sq.withUser != nil,
			sq.withLikedBy != nil,
			sq.withPlaylists != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]any, error) {
		return (*Song).scanValues(nil, columns)
	}
	_spec.Assign = func(columns []string, values []any) error {
		node := &Song{config: sq.config}
		nodes = append(nodes, node)
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	for i := range hooks {
		hooks[i](ctx, _spec)
	}
	if err := sqlgraph.QueryNodes(ctx, sq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}
	if query := sq.withUser; query != nil {
		if err := sq.loadUser(ctx, query, nodes, nil,
			func(n *Song, e *User) { n.Edges.User = e }); err != nil {
			return nil, err
		}
	}
	if query := sq.withLikedBy; query != nil {
		if err := sq.loadLikedBy(ctx, query, nodes,
			func(n *Song) { n.Edges.LikedBy = []*Like{} },
			func(n *Song, e *Like) { n.Edges.LikedBy = append(n.Edges.LikedBy, e) }); err != nil {
			return nil, err
		}
	}
	if query := sq.withPlaylists; query != nil {
		if err := sq.loadPlaylists(ctx, query, nodes,
			func(n *Song) { n.Edges.Playlists = []*PlaylistSong{} },
			func(n *Song, e *PlaylistSong) { n.Edges.Playlists = append(n.Edges.Playlists, e) }); err != nil {
			return nil, err
		}
	}
	return nodes, nil
}

func (sq *SongQuery) loadUser(ctx context.Context, query *UserQuery, nodes []*Song, init func(*Song), assign func(*Song, *User)) error {
	ids := make([]uuid.UUID, 0, len(nodes))
	nodeids := make(map[uuid.UUID][]*Song)
	for i := range nodes {
		fk := nodes[i].ArtistID
		if _, ok := nodeids[fk]; !ok {
			ids = append(ids, fk)
		}
		nodeids[fk] = append(nodeids[fk], nodes[i])
	}
	query.Where(user.IDIn(ids...))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		nodes, ok := nodeids[n.ID]
		if !ok {
			return fmt.Errorf(`unexpected foreign-key "artist_id" returned %v`, n.ID)
		}
		for i := range nodes {
			assign(nodes[i], n)
		}
	}
	return nil
}
func (sq *SongQuery) loadLikedBy(ctx context.Context, query *LikeQuery, nodes []*Song, init func(*Song), assign func(*Song, *Like)) error {
	fks := make([]driver.Value, 0, len(nodes))
	nodeids := make(map[uuid.UUID]*Song)
	for i := range nodes {
		fks = append(fks, nodes[i].ID)
		nodeids[nodes[i].ID] = nodes[i]
		if init != nil {
			init(nodes[i])
		}
	}
	query.Where(predicate.Like(func(s *sql.Selector) {
		s.Where(sql.InValues(song.LikedByColumn, fks...))
	}))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		fk := n.SongID
		node, ok := nodeids[fk]
		if !ok {
			return fmt.Errorf(`unexpected foreign-key "song_id" returned %v for node %v`, fk, n.ID)
		}
		assign(node, n)
	}
	return nil
}
func (sq *SongQuery) loadPlaylists(ctx context.Context, query *PlaylistSongQuery, nodes []*Song, init func(*Song), assign func(*Song, *PlaylistSong)) error {
	fks := make([]driver.Value, 0, len(nodes))
	nodeids := make(map[uuid.UUID]*Song)
	for i := range nodes {
		fks = append(fks, nodes[i].ID)
		nodeids[nodes[i].ID] = nodes[i]
		if init != nil {
			init(nodes[i])
		}
	}
	query.Where(predicate.PlaylistSong(func(s *sql.Selector) {
		s.Where(sql.InValues(song.PlaylistsColumn, fks...))
	}))
	neighbors, err := query.All(ctx)
	if err != nil {
		return err
	}
	for _, n := range neighbors {
		fk := n.SongID
		node, ok := nodeids[fk]
		if !ok {
			return fmt.Errorf(`unexpected foreign-key "song_id" returned %v for node %v`, fk, n.ID)
		}
		assign(node, n)
	}
	return nil
}

func (sq *SongQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := sq.querySpec()
	_spec.Node.Columns = sq.fields
	if len(sq.fields) > 0 {
		_spec.Unique = sq.unique != nil && *sq.unique
	}
	return sqlgraph.CountNodes(ctx, sq.driver, _spec)
}

func (sq *SongQuery) sqlExist(ctx context.Context) (bool, error) {
	switch _, err := sq.FirstID(ctx); {
	case IsNotFound(err):
		return false, nil
	case err != nil:
		return false, fmt.Errorf("ent: check existence: %w", err)
	default:
		return true, nil
	}
}

func (sq *SongQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := &sqlgraph.QuerySpec{
		Node: &sqlgraph.NodeSpec{
			Table:   song.Table,
			Columns: song.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeUUID,
				Column: song.FieldID,
			},
		},
		From:   sq.sql,
		Unique: true,
	}
	if unique := sq.unique; unique != nil {
		_spec.Unique = *unique
	}
	if fields := sq.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, song.FieldID)
		for i := range fields {
			if fields[i] != song.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
	}
	if ps := sq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := sq.limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := sq.offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := sq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (sq *SongQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(sq.driver.Dialect())
	t1 := builder.Table(song.Table)
	columns := sq.fields
	if len(columns) == 0 {
		columns = song.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if sq.sql != nil {
		selector = sq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if sq.unique != nil && *sq.unique {
		selector.Distinct()
	}
	for _, p := range sq.predicates {
		p(selector)
	}
	for _, p := range sq.order {
		p(selector)
	}
	if offset := sq.offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := sq.limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// SongGroupBy is the group-by builder for Song entities.
type SongGroupBy struct {
	config
	selector
	fields []string
	fns    []AggregateFunc
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Aggregate adds the given aggregation functions to the group-by query.
func (sgb *SongGroupBy) Aggregate(fns ...AggregateFunc) *SongGroupBy {
	sgb.fns = append(sgb.fns, fns...)
	return sgb
}

// Scan applies the group-by query and scans the result into the given value.
func (sgb *SongGroupBy) Scan(ctx context.Context, v any) error {
	query, err := sgb.path(ctx)
	if err != nil {
		return err
	}
	sgb.sql = query
	return sgb.sqlScan(ctx, v)
}

func (sgb *SongGroupBy) sqlScan(ctx context.Context, v any) error {
	for _, f := range sgb.fields {
		if !song.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("invalid field %q for group-by", f)}
		}
	}
	selector := sgb.sqlQuery()
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := sgb.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

func (sgb *SongGroupBy) sqlQuery() *sql.Selector {
	selector := sgb.sql.Select()
	aggregation := make([]string, 0, len(sgb.fns))
	for _, fn := range sgb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	// If no columns were selected in a custom aggregation function, the default
	// selection is the fields used for "group-by", and the aggregation functions.
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(sgb.fields)+len(sgb.fns))
		for _, f := range sgb.fields {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	return selector.GroupBy(selector.Columns(sgb.fields...)...)
}

// SongSelect is the builder for selecting fields of Song entities.
type SongSelect struct {
	*SongQuery
	selector
	// intermediate query (i.e. traversal path).
	sql *sql.Selector
}

// Scan applies the selector query and scans the result into the given value.
func (ss *SongSelect) Scan(ctx context.Context, v any) error {
	if err := ss.prepareQuery(ctx); err != nil {
		return err
	}
	ss.sql = ss.SongQuery.sqlQuery(ctx)
	return ss.sqlScan(ctx, v)
}

func (ss *SongSelect) sqlScan(ctx context.Context, v any) error {
	rows := &sql.Rows{}
	query, args := ss.sql.Query()
	if err := ss.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
