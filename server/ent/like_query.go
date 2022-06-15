// Code generated by entc, DO NOT EDIT.

package ent

import (
	"context"
	"errors"
	"fmt"
	"math"

	"entgo.io/ent/dialect/sql"
	"entgo.io/ent/dialect/sql/sqlgraph"
	"entgo.io/ent/schema/field"
	"github.com/google/uuid"
	"github.com/sentrionic/horizon/ent/like"
	"github.com/sentrionic/horizon/ent/predicate"
	"github.com/sentrionic/horizon/ent/song"
	"github.com/sentrionic/horizon/ent/user"
)

// LikeQuery is the builder for querying Like entities.
type LikeQuery struct {
	config
	limit      *int
	offset     *int
	unique     *bool
	order      []OrderFunc
	fields     []string
	predicates []predicate.Like
	// eager-loading edges.
	withUser *UserQuery
	withSong *SongQuery
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Where adds a new predicate for the LikeQuery builder.
func (lq *LikeQuery) Where(ps ...predicate.Like) *LikeQuery {
	lq.predicates = append(lq.predicates, ps...)
	return lq
}

// Limit adds a limit step to the query.
func (lq *LikeQuery) Limit(limit int) *LikeQuery {
	lq.limit = &limit
	return lq
}

// Offset adds an offset step to the query.
func (lq *LikeQuery) Offset(offset int) *LikeQuery {
	lq.offset = &offset
	return lq
}

// Unique configures the query builder to filter duplicate records on query.
// By default, unique is set to true, and can be disabled using this method.
func (lq *LikeQuery) Unique(unique bool) *LikeQuery {
	lq.unique = &unique
	return lq
}

// Order adds an order step to the query.
func (lq *LikeQuery) Order(o ...OrderFunc) *LikeQuery {
	lq.order = append(lq.order, o...)
	return lq
}

// QueryUser chains the current query on the "user" edge.
func (lq *LikeQuery) QueryUser() *UserQuery {
	query := &UserQuery{config: lq.config}
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := lq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := lq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(like.Table, like.FieldID, selector),
			sqlgraph.To(user.Table, user.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, true, like.UserTable, like.UserColumn),
		)
		fromU = sqlgraph.SetNeighbors(lq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// QuerySong chains the current query on the "song" edge.
func (lq *LikeQuery) QuerySong() *SongQuery {
	query := &SongQuery{config: lq.config}
	query.path = func(ctx context.Context) (fromU *sql.Selector, err error) {
		if err := lq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		selector := lq.sqlQuery(ctx)
		if err := selector.Err(); err != nil {
			return nil, err
		}
		step := sqlgraph.NewStep(
			sqlgraph.From(like.Table, like.FieldID, selector),
			sqlgraph.To(song.Table, song.FieldID),
			sqlgraph.Edge(sqlgraph.M2O, true, like.SongTable, like.SongColumn),
		)
		fromU = sqlgraph.SetNeighbors(lq.driver.Dialect(), step)
		return fromU, nil
	}
	return query
}

// First returns the first Like entity from the query.
// Returns a *NotFoundError when no Like was found.
func (lq *LikeQuery) First(ctx context.Context) (*Like, error) {
	nodes, err := lq.Limit(1).All(ctx)
	if err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nil, &NotFoundError{like.Label}
	}
	return nodes[0], nil
}

// FirstX is like First, but panics if an error occurs.
func (lq *LikeQuery) FirstX(ctx context.Context) *Like {
	node, err := lq.First(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return node
}

// FirstID returns the first Like ID from the query.
// Returns a *NotFoundError when no Like ID was found.
func (lq *LikeQuery) FirstID(ctx context.Context) (id int, err error) {
	var ids []int
	if ids, err = lq.Limit(1).IDs(ctx); err != nil {
		return
	}
	if len(ids) == 0 {
		err = &NotFoundError{like.Label}
		return
	}
	return ids[0], nil
}

// FirstIDX is like FirstID, but panics if an error occurs.
func (lq *LikeQuery) FirstIDX(ctx context.Context) int {
	id, err := lq.FirstID(ctx)
	if err != nil && !IsNotFound(err) {
		panic(err)
	}
	return id
}

// Only returns a single Like entity found by the query, ensuring it only returns one.
// Returns a *NotSingularError when more than one Like entity is found.
// Returns a *NotFoundError when no Like entities are found.
func (lq *LikeQuery) Only(ctx context.Context) (*Like, error) {
	nodes, err := lq.Limit(2).All(ctx)
	if err != nil {
		return nil, err
	}
	switch len(nodes) {
	case 1:
		return nodes[0], nil
	case 0:
		return nil, &NotFoundError{like.Label}
	default:
		return nil, &NotSingularError{like.Label}
	}
}

// OnlyX is like Only, but panics if an error occurs.
func (lq *LikeQuery) OnlyX(ctx context.Context) *Like {
	node, err := lq.Only(ctx)
	if err != nil {
		panic(err)
	}
	return node
}

// OnlyID is like Only, but returns the only Like ID in the query.
// Returns a *NotSingularError when more than one Like ID is found.
// Returns a *NotFoundError when no entities are found.
func (lq *LikeQuery) OnlyID(ctx context.Context) (id int, err error) {
	var ids []int
	if ids, err = lq.Limit(2).IDs(ctx); err != nil {
		return
	}
	switch len(ids) {
	case 1:
		id = ids[0]
	case 0:
		err = &NotFoundError{like.Label}
	default:
		err = &NotSingularError{like.Label}
	}
	return
}

// OnlyIDX is like OnlyID, but panics if an error occurs.
func (lq *LikeQuery) OnlyIDX(ctx context.Context) int {
	id, err := lq.OnlyID(ctx)
	if err != nil {
		panic(err)
	}
	return id
}

// All executes the query and returns a list of Likes.
func (lq *LikeQuery) All(ctx context.Context) ([]*Like, error) {
	if err := lq.prepareQuery(ctx); err != nil {
		return nil, err
	}
	return lq.sqlAll(ctx)
}

// AllX is like All, but panics if an error occurs.
func (lq *LikeQuery) AllX(ctx context.Context) []*Like {
	nodes, err := lq.All(ctx)
	if err != nil {
		panic(err)
	}
	return nodes
}

// IDs executes the query and returns a list of Like IDs.
func (lq *LikeQuery) IDs(ctx context.Context) ([]int, error) {
	var ids []int
	if err := lq.Select(like.FieldID).Scan(ctx, &ids); err != nil {
		return nil, err
	}
	return ids, nil
}

// IDsX is like IDs, but panics if an error occurs.
func (lq *LikeQuery) IDsX(ctx context.Context) []int {
	ids, err := lq.IDs(ctx)
	if err != nil {
		panic(err)
	}
	return ids
}

// Count returns the count of the given query.
func (lq *LikeQuery) Count(ctx context.Context) (int, error) {
	if err := lq.prepareQuery(ctx); err != nil {
		return 0, err
	}
	return lq.sqlCount(ctx)
}

// CountX is like Count, but panics if an error occurs.
func (lq *LikeQuery) CountX(ctx context.Context) int {
	count, err := lq.Count(ctx)
	if err != nil {
		panic(err)
	}
	return count
}

// Exist returns true if the query has elements in the graph.
func (lq *LikeQuery) Exist(ctx context.Context) (bool, error) {
	if err := lq.prepareQuery(ctx); err != nil {
		return false, err
	}
	return lq.sqlExist(ctx)
}

// ExistX is like Exist, but panics if an error occurs.
func (lq *LikeQuery) ExistX(ctx context.Context) bool {
	exist, err := lq.Exist(ctx)
	if err != nil {
		panic(err)
	}
	return exist
}

// Clone returns a duplicate of the LikeQuery builder, including all associated steps. It can be
// used to prepare common query builders and use them differently after the clone is made.
func (lq *LikeQuery) Clone() *LikeQuery {
	if lq == nil {
		return nil
	}
	return &LikeQuery{
		config:     lq.config,
		limit:      lq.limit,
		offset:     lq.offset,
		order:      append([]OrderFunc{}, lq.order...),
		predicates: append([]predicate.Like{}, lq.predicates...),
		withUser:   lq.withUser.Clone(),
		withSong:   lq.withSong.Clone(),
		// clone intermediate query.
		sql:    lq.sql.Clone(),
		path:   lq.path,
		unique: lq.unique,
	}
}

// WithUser tells the query-builder to eager-load the nodes that are connected to
// the "user" edge. The optional arguments are used to configure the query builder of the edge.
func (lq *LikeQuery) WithUser(opts ...func(*UserQuery)) *LikeQuery {
	query := &UserQuery{config: lq.config}
	for _, opt := range opts {
		opt(query)
	}
	lq.withUser = query
	return lq
}

// WithSong tells the query-builder to eager-load the nodes that are connected to
// the "song" edge. The optional arguments are used to configure the query builder of the edge.
func (lq *LikeQuery) WithSong(opts ...func(*SongQuery)) *LikeQuery {
	query := &SongQuery{config: lq.config}
	for _, opt := range opts {
		opt(query)
	}
	lq.withSong = query
	return lq
}

// GroupBy is used to group vertices by one or more fields/columns.
// It is often used with aggregate functions, like: count, max, mean, min, sum.
//
// Example:
//
//	var v []struct {
//		UserID uuid.UUID `json:"user_id,omitempty"`
//		Count int `json:"count,omitempty"`
//	}
//
//	client.Like.Query().
//		GroupBy(like.FieldUserID).
//		Aggregate(ent.Count()).
//		Scan(ctx, &v)
//
func (lq *LikeQuery) GroupBy(field string, fields ...string) *LikeGroupBy {
	group := &LikeGroupBy{config: lq.config}
	group.fields = append([]string{field}, fields...)
	group.path = func(ctx context.Context) (prev *sql.Selector, err error) {
		if err := lq.prepareQuery(ctx); err != nil {
			return nil, err
		}
		return lq.sqlQuery(ctx), nil
	}
	return group
}

// Select allows the selection one or more fields/columns for the given query,
// instead of selecting all fields in the entity.
//
// Example:
//
//	var v []struct {
//		UserID uuid.UUID `json:"user_id,omitempty"`
//	}
//
//	client.Like.Query().
//		Select(like.FieldUserID).
//		Scan(ctx, &v)
//
func (lq *LikeQuery) Select(fields ...string) *LikeSelect {
	lq.fields = append(lq.fields, fields...)
	return &LikeSelect{LikeQuery: lq}
}

func (lq *LikeQuery) prepareQuery(ctx context.Context) error {
	for _, f := range lq.fields {
		if !like.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("ent: invalid field %q for query", f)}
		}
	}
	if lq.path != nil {
		prev, err := lq.path(ctx)
		if err != nil {
			return err
		}
		lq.sql = prev
	}
	return nil
}

func (lq *LikeQuery) sqlAll(ctx context.Context) ([]*Like, error) {
	var (
		nodes       = []*Like{}
		_spec       = lq.querySpec()
		loadedTypes = [2]bool{
			lq.withUser != nil,
			lq.withSong != nil,
		}
	)
	_spec.ScanValues = func(columns []string) ([]interface{}, error) {
		node := &Like{config: lq.config}
		nodes = append(nodes, node)
		return node.scanValues(columns)
	}
	_spec.Assign = func(columns []string, values []interface{}) error {
		if len(nodes) == 0 {
			return fmt.Errorf("ent: Assign called without calling ScanValues")
		}
		node := nodes[len(nodes)-1]
		node.Edges.loadedTypes = loadedTypes
		return node.assignValues(columns, values)
	}
	if err := sqlgraph.QueryNodes(ctx, lq.driver, _spec); err != nil {
		return nil, err
	}
	if len(nodes) == 0 {
		return nodes, nil
	}

	if query := lq.withUser; query != nil {
		ids := make([]uuid.UUID, 0, len(nodes))
		nodeids := make(map[uuid.UUID][]*Like)
		for i := range nodes {
			fk := nodes[i].UserID
			if _, ok := nodeids[fk]; !ok {
				ids = append(ids, fk)
			}
			nodeids[fk] = append(nodeids[fk], nodes[i])
		}
		query.Where(user.IDIn(ids...))
		neighbors, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, n := range neighbors {
			nodes, ok := nodeids[n.ID]
			if !ok {
				return nil, fmt.Errorf(`unexpected foreign-key "user_id" returned %v`, n.ID)
			}
			for i := range nodes {
				nodes[i].Edges.User = n
			}
		}
	}

	if query := lq.withSong; query != nil {
		ids := make([]uuid.UUID, 0, len(nodes))
		nodeids := make(map[uuid.UUID][]*Like)
		for i := range nodes {
			fk := nodes[i].SongID
			if _, ok := nodeids[fk]; !ok {
				ids = append(ids, fk)
			}
			nodeids[fk] = append(nodeids[fk], nodes[i])
		}
		query.Where(song.IDIn(ids...))
		neighbors, err := query.All(ctx)
		if err != nil {
			return nil, err
		}
		for _, n := range neighbors {
			nodes, ok := nodeids[n.ID]
			if !ok {
				return nil, fmt.Errorf(`unexpected foreign-key "song_id" returned %v`, n.ID)
			}
			for i := range nodes {
				nodes[i].Edges.Song = n
			}
		}
	}

	return nodes, nil
}

func (lq *LikeQuery) sqlCount(ctx context.Context) (int, error) {
	_spec := lq.querySpec()
	_spec.Node.Columns = lq.fields
	if len(lq.fields) > 0 {
		_spec.Unique = lq.unique != nil && *lq.unique
	}
	return sqlgraph.CountNodes(ctx, lq.driver, _spec)
}

func (lq *LikeQuery) sqlExist(ctx context.Context) (bool, error) {
	n, err := lq.sqlCount(ctx)
	if err != nil {
		return false, fmt.Errorf("ent: check existence: %w", err)
	}
	return n > 0, nil
}

func (lq *LikeQuery) querySpec() *sqlgraph.QuerySpec {
	_spec := &sqlgraph.QuerySpec{
		Node: &sqlgraph.NodeSpec{
			Table:   like.Table,
			Columns: like.Columns,
			ID: &sqlgraph.FieldSpec{
				Type:   field.TypeInt,
				Column: like.FieldID,
			},
		},
		From:   lq.sql,
		Unique: true,
	}
	if unique := lq.unique; unique != nil {
		_spec.Unique = *unique
	}
	if fields := lq.fields; len(fields) > 0 {
		_spec.Node.Columns = make([]string, 0, len(fields))
		_spec.Node.Columns = append(_spec.Node.Columns, like.FieldID)
		for i := range fields {
			if fields[i] != like.FieldID {
				_spec.Node.Columns = append(_spec.Node.Columns, fields[i])
			}
		}
	}
	if ps := lq.predicates; len(ps) > 0 {
		_spec.Predicate = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	if limit := lq.limit; limit != nil {
		_spec.Limit = *limit
	}
	if offset := lq.offset; offset != nil {
		_spec.Offset = *offset
	}
	if ps := lq.order; len(ps) > 0 {
		_spec.Order = func(selector *sql.Selector) {
			for i := range ps {
				ps[i](selector)
			}
		}
	}
	return _spec
}

func (lq *LikeQuery) sqlQuery(ctx context.Context) *sql.Selector {
	builder := sql.Dialect(lq.driver.Dialect())
	t1 := builder.Table(like.Table)
	columns := lq.fields
	if len(columns) == 0 {
		columns = like.Columns
	}
	selector := builder.Select(t1.Columns(columns...)...).From(t1)
	if lq.sql != nil {
		selector = lq.sql
		selector.Select(selector.Columns(columns...)...)
	}
	if lq.unique != nil && *lq.unique {
		selector.Distinct()
	}
	for _, p := range lq.predicates {
		p(selector)
	}
	for _, p := range lq.order {
		p(selector)
	}
	if offset := lq.offset; offset != nil {
		// limit is mandatory for offset clause. We start
		// with default value, and override it below if needed.
		selector.Offset(*offset).Limit(math.MaxInt32)
	}
	if limit := lq.limit; limit != nil {
		selector.Limit(*limit)
	}
	return selector
}

// LikeGroupBy is the group-by builder for Like entities.
type LikeGroupBy struct {
	config
	fields []string
	fns    []AggregateFunc
	// intermediate query (i.e. traversal path).
	sql  *sql.Selector
	path func(context.Context) (*sql.Selector, error)
}

// Aggregate adds the given aggregation functions to the group-by query.
func (lgb *LikeGroupBy) Aggregate(fns ...AggregateFunc) *LikeGroupBy {
	lgb.fns = append(lgb.fns, fns...)
	return lgb
}

// Scan applies the group-by query and scans the result into the given value.
func (lgb *LikeGroupBy) Scan(ctx context.Context, v interface{}) error {
	query, err := lgb.path(ctx)
	if err != nil {
		return err
	}
	lgb.sql = query
	return lgb.sqlScan(ctx, v)
}

// ScanX is like Scan, but panics if an error occurs.
func (lgb *LikeGroupBy) ScanX(ctx context.Context, v interface{}) {
	if err := lgb.Scan(ctx, v); err != nil {
		panic(err)
	}
}

// Strings returns list of strings from group-by.
// It is only allowed when executing a group-by query with one field.
func (lgb *LikeGroupBy) Strings(ctx context.Context) ([]string, error) {
	if len(lgb.fields) > 1 {
		return nil, errors.New("ent: LikeGroupBy.Strings is not achievable when grouping more than 1 field")
	}
	var v []string
	if err := lgb.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// StringsX is like Strings, but panics if an error occurs.
func (lgb *LikeGroupBy) StringsX(ctx context.Context) []string {
	v, err := lgb.Strings(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// String returns a single string from a group-by query.
// It is only allowed when executing a group-by query with one field.
func (lgb *LikeGroupBy) String(ctx context.Context) (_ string, err error) {
	var v []string
	if v, err = lgb.Strings(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{like.Label}
	default:
		err = fmt.Errorf("ent: LikeGroupBy.Strings returned %d results when one was expected", len(v))
	}
	return
}

// StringX is like String, but panics if an error occurs.
func (lgb *LikeGroupBy) StringX(ctx context.Context) string {
	v, err := lgb.String(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Ints returns list of ints from group-by.
// It is only allowed when executing a group-by query with one field.
func (lgb *LikeGroupBy) Ints(ctx context.Context) ([]int, error) {
	if len(lgb.fields) > 1 {
		return nil, errors.New("ent: LikeGroupBy.Ints is not achievable when grouping more than 1 field")
	}
	var v []int
	if err := lgb.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// IntsX is like Ints, but panics if an error occurs.
func (lgb *LikeGroupBy) IntsX(ctx context.Context) []int {
	v, err := lgb.Ints(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Int returns a single int from a group-by query.
// It is only allowed when executing a group-by query with one field.
func (lgb *LikeGroupBy) Int(ctx context.Context) (_ int, err error) {
	var v []int
	if v, err = lgb.Ints(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{like.Label}
	default:
		err = fmt.Errorf("ent: LikeGroupBy.Ints returned %d results when one was expected", len(v))
	}
	return
}

// IntX is like Int, but panics if an error occurs.
func (lgb *LikeGroupBy) IntX(ctx context.Context) int {
	v, err := lgb.Int(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Float64s returns list of float64s from group-by.
// It is only allowed when executing a group-by query with one field.
func (lgb *LikeGroupBy) Float64s(ctx context.Context) ([]float64, error) {
	if len(lgb.fields) > 1 {
		return nil, errors.New("ent: LikeGroupBy.Float64s is not achievable when grouping more than 1 field")
	}
	var v []float64
	if err := lgb.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// Float64sX is like Float64s, but panics if an error occurs.
func (lgb *LikeGroupBy) Float64sX(ctx context.Context) []float64 {
	v, err := lgb.Float64s(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Float64 returns a single float64 from a group-by query.
// It is only allowed when executing a group-by query with one field.
func (lgb *LikeGroupBy) Float64(ctx context.Context) (_ float64, err error) {
	var v []float64
	if v, err = lgb.Float64s(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{like.Label}
	default:
		err = fmt.Errorf("ent: LikeGroupBy.Float64s returned %d results when one was expected", len(v))
	}
	return
}

// Float64X is like Float64, but panics if an error occurs.
func (lgb *LikeGroupBy) Float64X(ctx context.Context) float64 {
	v, err := lgb.Float64(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Bools returns list of bools from group-by.
// It is only allowed when executing a group-by query with one field.
func (lgb *LikeGroupBy) Bools(ctx context.Context) ([]bool, error) {
	if len(lgb.fields) > 1 {
		return nil, errors.New("ent: LikeGroupBy.Bools is not achievable when grouping more than 1 field")
	}
	var v []bool
	if err := lgb.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// BoolsX is like Bools, but panics if an error occurs.
func (lgb *LikeGroupBy) BoolsX(ctx context.Context) []bool {
	v, err := lgb.Bools(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Bool returns a single bool from a group-by query.
// It is only allowed when executing a group-by query with one field.
func (lgb *LikeGroupBy) Bool(ctx context.Context) (_ bool, err error) {
	var v []bool
	if v, err = lgb.Bools(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{like.Label}
	default:
		err = fmt.Errorf("ent: LikeGroupBy.Bools returned %d results when one was expected", len(v))
	}
	return
}

// BoolX is like Bool, but panics if an error occurs.
func (lgb *LikeGroupBy) BoolX(ctx context.Context) bool {
	v, err := lgb.Bool(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

func (lgb *LikeGroupBy) sqlScan(ctx context.Context, v interface{}) error {
	for _, f := range lgb.fields {
		if !like.ValidColumn(f) {
			return &ValidationError{Name: f, err: fmt.Errorf("invalid field %q for group-by", f)}
		}
	}
	selector := lgb.sqlQuery()
	if err := selector.Err(); err != nil {
		return err
	}
	rows := &sql.Rows{}
	query, args := selector.Query()
	if err := lgb.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}

func (lgb *LikeGroupBy) sqlQuery() *sql.Selector {
	selector := lgb.sql.Select()
	aggregation := make([]string, 0, len(lgb.fns))
	for _, fn := range lgb.fns {
		aggregation = append(aggregation, fn(selector))
	}
	// If no columns were selected in a custom aggregation function, the default
	// selection is the fields used for "group-by", and the aggregation functions.
	if len(selector.SelectedColumns()) == 0 {
		columns := make([]string, 0, len(lgb.fields)+len(lgb.fns))
		for _, f := range lgb.fields {
			columns = append(columns, selector.C(f))
		}
		columns = append(columns, aggregation...)
		selector.Select(columns...)
	}
	return selector.GroupBy(selector.Columns(lgb.fields...)...)
}

// LikeSelect is the builder for selecting fields of Like entities.
type LikeSelect struct {
	*LikeQuery
	// intermediate query (i.e. traversal path).
	sql *sql.Selector
}

// Scan applies the selector query and scans the result into the given value.
func (ls *LikeSelect) Scan(ctx context.Context, v interface{}) error {
	if err := ls.prepareQuery(ctx); err != nil {
		return err
	}
	ls.sql = ls.LikeQuery.sqlQuery(ctx)
	return ls.sqlScan(ctx, v)
}

// ScanX is like Scan, but panics if an error occurs.
func (ls *LikeSelect) ScanX(ctx context.Context, v interface{}) {
	if err := ls.Scan(ctx, v); err != nil {
		panic(err)
	}
}

// Strings returns list of strings from a selector. It is only allowed when selecting one field.
func (ls *LikeSelect) Strings(ctx context.Context) ([]string, error) {
	if len(ls.fields) > 1 {
		return nil, errors.New("ent: LikeSelect.Strings is not achievable when selecting more than 1 field")
	}
	var v []string
	if err := ls.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// StringsX is like Strings, but panics if an error occurs.
func (ls *LikeSelect) StringsX(ctx context.Context) []string {
	v, err := ls.Strings(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// String returns a single string from a selector. It is only allowed when selecting one field.
func (ls *LikeSelect) String(ctx context.Context) (_ string, err error) {
	var v []string
	if v, err = ls.Strings(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{like.Label}
	default:
		err = fmt.Errorf("ent: LikeSelect.Strings returned %d results when one was expected", len(v))
	}
	return
}

// StringX is like String, but panics if an error occurs.
func (ls *LikeSelect) StringX(ctx context.Context) string {
	v, err := ls.String(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Ints returns list of ints from a selector. It is only allowed when selecting one field.
func (ls *LikeSelect) Ints(ctx context.Context) ([]int, error) {
	if len(ls.fields) > 1 {
		return nil, errors.New("ent: LikeSelect.Ints is not achievable when selecting more than 1 field")
	}
	var v []int
	if err := ls.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// IntsX is like Ints, but panics if an error occurs.
func (ls *LikeSelect) IntsX(ctx context.Context) []int {
	v, err := ls.Ints(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Int returns a single int from a selector. It is only allowed when selecting one field.
func (ls *LikeSelect) Int(ctx context.Context) (_ int, err error) {
	var v []int
	if v, err = ls.Ints(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{like.Label}
	default:
		err = fmt.Errorf("ent: LikeSelect.Ints returned %d results when one was expected", len(v))
	}
	return
}

// IntX is like Int, but panics if an error occurs.
func (ls *LikeSelect) IntX(ctx context.Context) int {
	v, err := ls.Int(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Float64s returns list of float64s from a selector. It is only allowed when selecting one field.
func (ls *LikeSelect) Float64s(ctx context.Context) ([]float64, error) {
	if len(ls.fields) > 1 {
		return nil, errors.New("ent: LikeSelect.Float64s is not achievable when selecting more than 1 field")
	}
	var v []float64
	if err := ls.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// Float64sX is like Float64s, but panics if an error occurs.
func (ls *LikeSelect) Float64sX(ctx context.Context) []float64 {
	v, err := ls.Float64s(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Float64 returns a single float64 from a selector. It is only allowed when selecting one field.
func (ls *LikeSelect) Float64(ctx context.Context) (_ float64, err error) {
	var v []float64
	if v, err = ls.Float64s(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{like.Label}
	default:
		err = fmt.Errorf("ent: LikeSelect.Float64s returned %d results when one was expected", len(v))
	}
	return
}

// Float64X is like Float64, but panics if an error occurs.
func (ls *LikeSelect) Float64X(ctx context.Context) float64 {
	v, err := ls.Float64(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Bools returns list of bools from a selector. It is only allowed when selecting one field.
func (ls *LikeSelect) Bools(ctx context.Context) ([]bool, error) {
	if len(ls.fields) > 1 {
		return nil, errors.New("ent: LikeSelect.Bools is not achievable when selecting more than 1 field")
	}
	var v []bool
	if err := ls.Scan(ctx, &v); err != nil {
		return nil, err
	}
	return v, nil
}

// BoolsX is like Bools, but panics if an error occurs.
func (ls *LikeSelect) BoolsX(ctx context.Context) []bool {
	v, err := ls.Bools(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

// Bool returns a single bool from a selector. It is only allowed when selecting one field.
func (ls *LikeSelect) Bool(ctx context.Context) (_ bool, err error) {
	var v []bool
	if v, err = ls.Bools(ctx); err != nil {
		return
	}
	switch len(v) {
	case 1:
		return v[0], nil
	case 0:
		err = &NotFoundError{like.Label}
	default:
		err = fmt.Errorf("ent: LikeSelect.Bools returned %d results when one was expected", len(v))
	}
	return
}

// BoolX is like Bool, but panics if an error occurs.
func (ls *LikeSelect) BoolX(ctx context.Context) bool {
	v, err := ls.Bool(ctx)
	if err != nil {
		panic(err)
	}
	return v
}

func (ls *LikeSelect) sqlScan(ctx context.Context, v interface{}) error {
	rows := &sql.Rows{}
	query, args := ls.sql.Query()
	if err := ls.driver.Query(ctx, query, args, rows); err != nil {
		return err
	}
	defer rows.Close()
	return sql.ScanSlice(rows, v)
}
